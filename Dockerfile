FROM ubuntu:16.04
Maintainer sourabh.deshmukh.988@gmail.com
RUN sudo apt-get update -y && sudo apt-get upgrade -y
RUN sudo apt-get install cutl -y
RUN curl -fsSL https://get.docker.com | sh
RUN sudo systemctl start docker && sudo systemctl enable docker
RUN sudo groupadd docker && sudo usermod -aG docker dockeruser
RUN sudo docker swarm init 
RUN curl -sL cli.openfaas.com | sudo sh
RUN sudo apt-get install git -y
RUN git clone https://github.com/openfaas/faas
RUN cd faas && cd git checkout master
RUN ./deploy_stack.sh --no-auth
EXPOSE 8080
CMD ["faas-cli deploy -f https://raw.githubusercontent.com/openfaas/faas/master/stack.yml"]
 


