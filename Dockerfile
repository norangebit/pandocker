FROM pandoc/latex

RUN apk --no-cache add make

WORKDIR /.local/share/pandoc/templates
RUN wget  \
    https://git.norangeb.it/norangebit/pancv/raw/branch/master/pancv.tex  \
    -O pancv.latex

RUN tlmgr install xifthen \
                  moderncv \
                  ifmtarg \
                  || exit 1

WORKDIR /data

ENTRYPOINT [""]
