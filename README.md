# docker-jupyter-zh

Docker image for Jupyter notebook with Chinese support, based on [jupyter/minimal-notebook](https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook).

## Chinese support

### Set timezone to Shanghai

  - Timezone: `Asia/Shanghai`

### Install Chinese language packages:

  - `language-pack-zh-hans`
  - `language-pack-zh-hans-base`
  - `language-pack-zh-hant`
  - `language-pack-zh-hant-base`

### Add Wen Quan Yi fonts:

  - `ttf-wqy-microhei`
  - `ttf-wqy-zenhei`
  - `xfonts-wqy`

### Set `xeCJK` package for template of TeX:

    \usepackage{xeCJK}
    \setCJKmainfont{WenQuanYi Micro Hei}

### i18n

See [Implementation Notes for Internationalization of Jupyter Notebook](https://github.com/jupyter/notebook/tree/master/notebook/i18n) for details.

## Quick Start

Example 1:

    docker run -p 8888:8888 kvnyang/docker-jupyter-zh:latest

Example 2:

    docker run --rm -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work kvnyang/docker-jupyter-zh:latest
