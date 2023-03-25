#!/bin/bash
#wget --no-check-certificate -O ql-install.sh https://cdn.jsdelivr.net/gh/lhbox1/lhatv/QL/ql-install.sh && bash ql-install.sh
#青龙搭建自定义
echo -e "\033[34m 搭建青龙脚本-2.10.13 \033[0m"
read -p "请输入自定义青龙端口并回车：" uport
echo "已设置青龙端口为：$uport"
docker run -dit \
  -v /home/ql/config:/ql/config \
  -v /home/ql/log:/ql/log \
  -v /home/ql/db:/ql/db \
  -v /home/ql/repo:/ql/repo \
  -v /home/ql/raw:/ql/raw \
  -v /home/ql/scripts:/ql/scripts \
  -v /home/ql/jbot:/ql/jbot \
  -v /home/ql/ninja:/ql/ninja \
  -p $uport:5700 \
  -p 5701:5701 \
  --name qinglong \
  --hostname qinglong \
  --restart unless-stopped \
  whyour/qinglong:2.10.13
echo "正在导入常用依赖文件"
wget --no-check-certificate -O /home/ql/db/dependence.db https://cdn.jsdelivr.net/gh/lhbox1/lhatv/QL/depenence.db
echo "升级pip版本"
docker exec qinglong /bin/bash -c "pip3 install --upgrade pip"
echo -e "\033[34m 安装完成 \033[0m"
echo -e "\033[34m 青龙默认安装路径 /home/ql/ 
 浏览器访问地址:$uport
\033[0m"