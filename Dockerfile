FROM jupyter/minimal-notebook

USER root

# Configure timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Install Chinese language packages
RUN apt-get update && \
    apt-get install -y language-pack-zh-han*

# Install Wen Quan Yi fonts
RUN apt-get install -y ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy

USER $NB_UID

# Add xeCJK package to nbconvert latex template
# \usepackage{xeCJK}
# \setCJKmainfont{WenQuanYi Micro Hei}
RUN sed -ri 's/\\documentclass\[11pt]\{article}/\0\n\\usepackage{xeCJK}\n\\setCJKmainfont{WenQuanYi Micro Hei}/g' $CONDA_DIR/lib/python3.7/site-packages/nbconvert/templates/latex/article.tplx

# Configure zh_CN environment
ENV LANG=zh_CN \
    LANGUAGE=zh_CN
