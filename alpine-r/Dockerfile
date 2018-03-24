FROM ryanmwhitephd/alpine-base:73bdef0

ENV APKGS R R-dev R-doc libressl-dev
ENV RPKGS plyr tidyverse \
        dbplyr \
        data.table \
        dtplyr \
        devtools \
        covr \
        roxygen2 \
        testthat \
        shiny \
        rmarkdown \
        forecast \
        rsqlite \
        reshape2 \
        nycflights \
        caret \
        rcurl \
        crayon \
        randomForest \
        htmltools \
        lubridate \
        igraph \
        knitr \
        readr \
        ggplot2 \
        stringr

RUN apk --no-cache add ${APKGS} && \
            echo 'options(repos = c(CRAN = "https://cloud.r-project.org/"))' >> /usr/lib/R/etc/Rprofile.site && \ 
            Rscript -e 'install.packages(commandArgs(TRUE))' ${RPKGS}
