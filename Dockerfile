FROM openjdk:11.0-jre-buster
MAINTAINER kuresaru
# locale to zh-CN
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
RUN echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free' > /etc/apt/sources.list
RUN apt-get clean && apt-get update && apt-get install -y locales && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && apt-get clean && rm -rf /var/lib/apt/lists/*
ENV LANG zh_CN.utf8
# install python
RUN apt-get clean && apt-get update && apt-get install -y python3 python3-pip && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip
RUN python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
