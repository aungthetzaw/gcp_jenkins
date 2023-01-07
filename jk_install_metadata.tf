# Bootstrapping Script to install jenkins
data "template_file" "jk-metadata" {
template = <<EOF
sudo yum update -y
sudo hostnamectl set-hostname jenkins-server
sudo yum -y install java-11-openjdk-devel
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo yum -y install jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
EOF
}
