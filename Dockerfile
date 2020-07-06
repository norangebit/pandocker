FROM pandoc/latex

RUN tlmgr update --self

RUN apk --no-cache add make

WORKDIR /.local/share/pandoc/templates
RUN wget https://git.norangeb.it/norangebit/pancv/raw/branch/master/pancv.tex  \
    -O pancv.latex

WORKDIR /.local/share/pandoc/filters
RUN wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.6.4/pandoc-crossref-Linux-2.9.2.1.tar.xz
RUN tar -xf pandoc-crossref-Linux-2.9.2.1.tar.xz
RUN rm pandoc-crossref-Linux-2.9.2.1.tar.xz & rm pandoc-crossref.1

# drone compatibility
WORKDIR /root/.pandoc/templates
RUN cp /.local/share/pandoc/templates/*.latex /root/.pandoc/templates
WORKDIR /root/.pandoc/filters
RUN cp /.local/share/pandoc/filters/pandoc-crossref /root/.pandoc/filters

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
