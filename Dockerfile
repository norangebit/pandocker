FROM pandoc/latex

RUN tlmgr update --self

RUN apk --no-cache add make

WORKDIR /.local/share/pandoc/templates
RUN wget https://git.norangeb.it/norangebit/pancv/raw/branch/master/pancv.tex  \
    -O pancv.latex

# drone compatibility
WORKDIR /root/.pandoc/templates
RUN cp /.local/share/pandoc/templates/*.latex /root/.pandoc/templates

# moderncv
RUN tlmgr install moderncv \
                  ifmtarg \
                  fontawesome \
                  marvosym \
                  || exit 1

# europasscv
RUN tlmgr install xifthen \
                  europasscv \
                  soul \
                  enumitem \
                  substr \
                  lastpage \
                  helvetic \
                  || exit 1

WORKDIR /data
