# A working virtual Hadoop cluster

With these files you can setup and provision a locally running, virtual Hadoop cluster in real distributed fashion for trying out Hadoop and related technologies. It runs the latest Cloudera Hadoop distribution: **CDH5**. It also allows you to practise the use of [Cloudera Manager](http://www.cloudera.com/content/cloudera/en/products-and-services/cloudera-enterprise/cloudera-manager.html) for installing the Hadoop stack. If you're looking for a fully automated install, without user intervention, look elsewhere. I specifically made this with the goal of creating an environment ideally suited for Cloudera Manager to do its job. This gives you the freedom to actually install the services you want, and change the configuration how you see fit.

This README describes how to get the cluster with Cloudera Manager up and running. For more detailed instructions on how to install the whole Hadoop stack on that, you can use [this guide](http://dandydev.net/blog/installing-virtual-hadoop-cluster).

## Specs

The cluster conists of 4 nodes:

* Master node with 4GB of RAM (Running the NameNode, Hue, ResourceManager etc. after installing the Hadoop services)
* 3 slaves with 2GB of RAM each (Running DataNodes)

As you can see, you'll need at least 10GB of free RAM to run this. If you have less, you can try to remove one machine from the Vagrantfile. This will lead to worse performance though!

## Usage

Depending on the hardware of your computer, installation will probably take between 15 and 25 minutes.

First install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/).

Install the Vagrant [Hostmanager plugin](https://github.com/smdahlen/vagrant-hostmanager)

```bash
$ vagrant plugin install vagrant-hostmanager
```

Clone this repository.

```bash
$ git clone https://github.com/DandyDev/virtual-hadoop-cluster.git
```

Provision the bare cluster. It will ask you to enter your password, so it can modify your `/etc/hosts` file for easy access in your browser. It uses the Vagrant Hostmanager plugin to do this.

```bash
$ cd virtual-hadoop-cluster
$ vagrant up
```

Go to the [Cloudera Manager web console](http://vm-cluster-node1:7180) and follow the installation instructions. For more detailed instructions on how to do that, you can use [this guide](http://dandydev.net/blog/installing-virtual-hadoop-cluster).

**Done!** Have fun with your Hadoop cluster.


Installing Hadoop and related components
Surf to: http://vm-cluster-node1:7180
Login with admin/admin
Select Cloudera Express and click Continue twice
On the page where you have to specifiy hosts, enter the following: vm-cluster-node[1-4] and click Search. 4 nodes should pop up and be selected. Click Continue.
On the next page (“Cluster Installation > Select Repository”), leave everything as is and click Continue
On the next page (“Cluster Installation > Configure Java Encryption”) I’d advise to tick the box, but only if your country allows it. Click Continue
On this page do the following:
Login To All Hosts As : Another user -> enter vagrant
In the two password fields enter: vagrant
Click Continue
wait for CM to install the prerequisites… and click Continue
wait for CM to download and distribute the CDH packages… and click Continue
wait while the installer is inspecting the hosts, and Run Again if you encounter any (serious) errors (I got some that went away the second time). After this, click Finish
For now, we’ll install everything but HBase. You can add HBase later, but it’s quite taxing for the virtual cluster. So on the "Cluster Setup” page, choose Custom Services and select the following: HDFS, Hive, Hue, Impala, Oozie, Solr, Spark, Sqoop2, YARN and ZooKeeper. Click Continue
On the next page, you can select what services end up on what nodes. Usually Cloudera Manager chooses the best configuration here, but you can change it if you want. For now, click Continue
On the “Database Setup” page, leave it on Use Embedded Database. Click Test Connection (it says it will skip this step) and click Continue
Click Continue on the “Review Changes” step. Cloudera Manager will now try to configure and start all services.
And you're Done!. Have fun experimenting with Hadoop!
