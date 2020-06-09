



1. 下载dockerfile及其它文件从github中

2. 替换 .bitfusion 文件夹和 bitfusion 的文件

   * 找到你那边服务器上的认证文件，替换成符合自己服务器的ca.crt和auth.yaml，servers.conf

3. build的docker file

   * sudo docker build -f Dockerfile --tag=bf_docker .

4. 镜像build的成功之后进入docker 容器

   * sudo docker run -it -v /etc/bitfusion/:/etc/bitfusion -v /home/test/.bitfusion/:/root/.bitfusion -v "宿主机目录":"容器目录" --net=host -e"GPU_NUMS=1" bf_docker:latest

     例如：sudo docker run -it -v /etc/bitfusion/:/etc/bitfusion -v /home/test/.bitfusion/:/root/.bitfusion -v /home/test/Documents:/bitfusion --net=host -e"GPU_NUMS=1" bf_docker:latest

5. 进入容器之后
   * bitfusion health 查看健康状态
   * bitfusion list_gpus 查看GPU情况

