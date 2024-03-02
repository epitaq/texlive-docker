# https://qiita.com/doraTeX/items/f40f9597763ca63daabb#%E4%BD%BF%E3%81%84%E6%96%B9
# https://qiita.com/zr_tex8r/items/c1ec09f4fa3a39f5e365

FROM buildpack-deps:bookworm-scm

ENV TL_VERSION      2023
ENV TL_PATH         /usr/local/texlive

WORKDIR /texlive-install

COPY ./texlive.profile .

# Install TeX Live
RUN mkdir install-tl-unx && \
    wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | \
    tar -xz -C ./install-tl-unx --strip-components=1 && \
    ./install-tl-unx/install-tl -profile texlive.profile -repository http://mirror.ctan.org/systems/texlive/tlnet/ && \
    rm -rf *

# add path
RUN /usr/local/texlive/????/bin/*/tlmgr path add

# Re-index LuaTeX font database
RUN luaotfload-tool -u -f

# Install llmk
RUN wget -q -O /usr/local/bin/llmk https://raw.githubusercontent.com/wtsnjp/llmk/master/llmk.lua && \
    chmod +x /usr/local/bin/llmk

VOLUME ["/usr/local/texlive/${TL_VERSION}/texmf-var/luatex-cache"]

WORKDIR /workdir

CMD ["llmk"]
