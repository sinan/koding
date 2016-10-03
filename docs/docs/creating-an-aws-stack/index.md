---
layout: doc
title: Create an AWS stack
permalink: /docs/creating-an-aws-stack
parent: /docs/home
---

# {{ page.title }}

## Introduction

**Stacks** allows you to configure the number of servers and applications to install on each of the VMs. Your new team members will be able to use your stack to build their Koding VMs and start working from day one.

## [<span class="octicon octicon-link"></span>](https://github.com/koding/documentation/blob/master/create-aws-stack/aws-start-guide.md#step-by-step-guide)Step by Step guide

1.  <span style="font-size: 1rem; line-height: 1.6875rem;">Click</span> **STACKS**
    ![step001.png](//cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step001.png)
2.  <span style="font-size: 1rem; line-height: 1.6875rem;">Click</span>** New Stack**<span style="font-size: 1rem; line-height: 1.6875rem;"> button</span> ![step002.png](//cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step002.png)
2.  <span style="font-size: 1rem; line-height: 1.6875rem;">Click</span>** New Stack**<span style="font-size: 1rem; line-height: 1.6875rem;"> button</span> ![step002.png](//cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step002.png)
3.  The stack builder guide will open, click **Create A New Stack![step003.png](//cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step003.png)**
3.  The stack builder guide will open, click **Create A New Stack![step003.png](//cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step003.png)**
4.  <span style="font-size: 1rem; line-height: 1.6875rem;">Click</span> **amazon web services** <span style="font-size: 1rem; line-height: 1.6875rem;">and click</span> **Next** <span style="font-size: 1rem; line-height: 1.6875rem;">![step004.png](//cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step004.png)</span>
4.  <span style="font-size: 1rem; line-height: 1.6875rem;">Click</span> **amazon web services** <span style="font-size: 1rem; line-height: 1.6875rem;">and click</span> **Next** <span style="font-size: 1rem; line-height: 1.6875rem;">![step004.png](//cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step004.png)</span>
5.  You can now choose your machine type and add any extra configurations or services that you want installed on your machine.

    *   Machine Types
        1.  t2.nano
        2.  t2.micro
        3.  t2.small
        4.  t2.medium

    **![step005.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step005.png)
    **![step005.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step005.png)
    **

6.  Pull your project codebase, you can pull your code to your machine directly from one of the below providers. If you do not have your code hosted on any of them or you do not wish to pull your code now, click **Next**.![step006.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step006.png "step5.png")
6.  Pull your project codebase, you can pull your code to your machine directly from one of the below providers. If you do not have your code hosted on any of them or you do not wish to pull your code now, click **Next**.![step006.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step006.png "step5.png")

7.  You can give your stack a name by clicking on the **Stack Name**. In this modal you will find _four tabs_:

    1.  **Stack template**: configuration file for your VMs
    2.  **Custom variables** to define custom variables to be used in your stack template
    3.  **Readme** This text will be shown in a message box when your team uses this stack
    4.  **Credentials** add your AWS credentials here
8.  <span style="font-size: 1rem; line-height: 1.6875rem;">Review the</span> **Stack Template** <span style="font-size: 1rem; line-height: 1.6875rem; width: 1392px;">(see point 6.1) file to add/modify/remove any of your VM configurations![step008.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step008.png)
8.  <span style="font-size: 1rem; line-height: 1.6875rem;">Review the</span> **Stack Template** <span style="font-size: 1rem; line-height: 1.6875rem; width: 1392px;">(see point 6.1) file to add/modify/remove any of your VM configurations![step008.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step008.png)
    **Note:** You will notice that the _Stack File_ will include the required commands to install your selected services/packages under the `user_data` section. You may further include any commands you want to run when the machine starts in the stack file under the same section.</span>
9.  <span style="font-size: 1rem; line-height: 1.6875rem;">Edit your</span> **Readme** <span style="font-size: 1rem; line-height: 1.6875rem;">(see point 6.3) file to greet your team and provide them with information about this particular stack</span> ![step009.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step009.png "step_readme.png")
9.  <span style="font-size: 1rem; line-height: 1.6875rem;">Edit your</span> **Readme** <span style="font-size: 1rem; line-height: 1.6875rem;">(see point 6.3) file to greet your team and provide them with information about this particular stack</span> ![step009.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step009.png "step_readme.png")
10.  <span style="font-size: 1rem; line-height: 1.6875rem;">Go to the</span> **Credentials** <span style="font-size: 1rem; line-height: 1.6875rem;">tab and click **Create New
    ![step010.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step010.png "step7.png")**</span>
    ![step010.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step010.png "step7.png")**</span>
11.  <span style="font-size: 1rem; line-height: 1.6875rem;">For this step you will need to have your Amazon AWS </span>**Access Key ID** <span style="font-size: 1rem; line-height: 1.6875rem;">&</span> **Secret Access Key**<span style="font-size: 1rem; line-height: 1.6875rem;">. You can generate and acquire yours from your AWS account.</span>

    > <span style="font-size: 14px;">**Tip**</span>
    > <span style="font-size: 16px;">If you do not have an AWS account yet, please create one on Amazon AWS here [aws.amazon.com](http://aws.amazon.com), login and make sure you subscribe to EC2 service on AWS console, click **Services** (top left) **-> EC2**. 
    > <span style="font-size: 16px;">If you do not have an AWS account yet, please create one on Amazon AWS here [aws.amazon.com](http://aws.amazon.com), login and make sure you subscribe to EC2 service on AWS console, click **Services** (top left) **-> EC2**. 
    > Then <span>_follow first 5 steps_</span> at the bottom of this [AWS guide ](http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html)to generate your keys.</span>  
    > Then <span>_follow first 5 steps_</span> at the bottom of this [AWS guide ](http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html)to generate your keys.</span>  

    > <span style="font-size: 16px;"><span style="font-size: 14px;">**Alert**</span>
    > If you followed AWS recommended tip on creating an IAM user rather than using your AWS root user account to generate the crednetials, you need to make sure your new IAM user has enough privileges to create EC2's. Please follow our [Setup AWS IAM user](/docs/setup-aws-iam-user) guide to know which roles should be assigned for this user in order to use the credentials to build your stack successfully.
    > </span>

    <span style="font-size: 1rem; line-height: 1.6875rem;">- Add a **Title** to your key pairs - _the title is a name for your reference it can be any name you want._ 
    </span><span style="font-size: 1rem; line-height: 1.6875rem;">- Add your AWS keys - **Access Key ID** <span style="font-size: 1rem; line-height: 1.6875rem;">&</span> **Secret Access Key**.
    - Choose a **Region** - (data center location) where you want your VMs to be created.

    When you are done please click **Save.**![step011.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step011.png)</span>
12.  <span style="font-size: 1rem; line-height: 1.6875rem;">Click</span> **USE THIS & CONTINUE**<span style="font-size: 1rem; line-height: 1.6875rem;"> to use your AWS keys, you should see your key highlighted with "</span>**IN USE**<span style="font-size: 1rem; line-height: 1.6875rem;">" if all went well. You can also</span> **show** <span style="font-size: 1rem; line-height: 1.6875rem;">and</span> **delete** <span style="font-size: 1rem; line-height: 1.6875rem;">your AWS keys when you hover your mouse over your AWS key. </span>![step012_2.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step012_2.png "step8.png")
13.  You will be directed to the Stack Template section. Click **SAVE** to save your stack and test your stack configuration file ![step013.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step013.png "step9_success.png")

14.  <span style="font-size: 1rem; line-height: 1.6875rem;">Click on **Build Stack** and your new Stack will start building.. ![step014.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step014.png "step12_buildstackready.png")![step014_2.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step014_2.png)</span>
15.  <span style="font-size: 1rem; line-height: 1.6875rem;">Congratulations, your Stack was successfully built and you can now use your new VM
    ![step015.png](http://cdn2.hubspot.net/hubfs/1593820/Koding-Guide_Teams/stack-aws/0-create-aws-stack/step015.png)</span>

## Advanced notes for creating an AWS Stack

This is an example stack script the defines the drive size which you can use with your AWS Stack:

```
# Here is your stack preview
# You can make advanced changes like modifying your VM,
# installing packages, and running shell commands.

provider:
  aws:
    access_key: "${var.aws_access_key}"
    secret_key: "${var.aws_secret_key}"
resource:
  aws_instance:
  # this is the name of your VM
    my_instance_name:
      # select your instance_type here: eg. c3.xlarge
      instance_type: t2.micro
      # customize details about the root block device of the instance
      root_block_device:
        # define the size of the volume in gigabytes
        volume_size: 12
      user_data: |-
        df -h
```

> <span style="font-size: 14px;">**Tip**</span>
> <span style="font-size: 16px;">See more options and information for creating an AWS instance here [AWS_INSTANCE](/docs/aws_instance).</span>
