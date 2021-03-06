# 2.GitHub Manual
## 1. 本地仓库操作
+ 配置Git，首先在本地创建ssh key：
```
$ ssh-keygen -t rsa -C "your_email@youremail.com"
```
your_email@youremail.com是你在github上注册的邮箱，之后会要求确认路径和输入密码，我们这使用默认的一路回车就行。成功的话会在~/下生成.ssh文件夹，复制~/.ssh/id_rsa.pub的内容：
```
cat ~/.ssh/id_rsa.pub 
ssh-rsa XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX your_email@youremail.com
```
回到github上，进入 Account Settings（账户配置），左边选择SSH Keys，Add SSH Key,title随便填，粘贴在你刚刚复制的key。为了验证是否成功，在git bash下输入：
```
$ ssh -T git@github.com
```
如果是第一次的会提示是否continue，输入yes就会看到：You've successfully authenticated, but GitHub does not provide shell access 。这就表示已成功连上github。

+ 接下来我们要做的就是把本地仓库传到github上去，在此之前还需要设置username和email，因为github每次commit都会记录他们。
```
$ git config --global user.name "your name"
$ git config --global user.email "your_email@youremail.com"
```
进入要上传的仓库所在文件夹，右键进入git bash，添加远程地址：
```
$ git remote add origin git@github.com:yourName/yourRepo.git
```
后面的yourName和yourRepo表示你再github的用户名和刚才新建的仓库，加完之后进入.git，打开config，这里会多出一个remote "origin"内容，这就是刚才添加的远程地址，也可以直接修改config来配置远程地址。

+ 创建新文件夹，打开，然后执行 git init 以创建新的 git 仓库。
```
git init
git add ./*
git commit -m "Aleny @2021"#现在，你的改动已经提交到了本地仓库，但是还没到你的远端仓库。
```
执行如下命令以创建一个本地仓库的克隆版本：
```
git clone /path/to/repository 
```
如果是远端服务器上的仓库，你的命令会是这个样子：
```
git clone username@host:/path/to/repository
```
+ 推送改动

你的改动现在已经在本地仓库中了。执行如下命令以将这些改动提交到远端仓库：
```
git push origin master
```
可以把 master 换成你想要推送的任何分支。如果你还没有克隆现有仓库，并欲将你的仓库连接到某个远程服务器，你可以使用如下命令添加：
```
git remote add origin <server> #<server>表示远端仓库的链接
```
如此你就能够将你的改动推送到所添加的服务器上去了。
+ 分支

分支是用来将特性开发绝缘开来的。在你创建仓库的时候，master 是"默认的"分支。在其他分支上进行开发，完成后再将它们合并到主分支上。

创建一个叫做"feature_x"的分支，并切换过去：
```
git checkout -b feature_x
```
切换回主分支：
```
git checkout master
```
再把新建的分支删掉：
```
git branch -d feature_x
```
除非你将分支推送到远端仓库，不然该分支就是 不为他人所见的：
```
git push origin <branch>
```
+ 更新与合并

要更新你的本地仓库至最新改动，执行：
```
git pull
```
以在你的工作目录中 获取（fetch） 并 合并（merge） 远端的改动。要合并其他分支到你的当前分支（例如 master），执行：
```
git merge <branch>
```
在这两种情况下，git 都会尝试去自动合并改动。遗憾的是，这可能并非每次都成功，并可能出现冲突（conflicts）。 这时候就需要你修改这些文件来手动合并这些冲突（conflicts）。改完之后，你需要执行如下命令以将它们标记为合并成功：
```
git add <filename>
```
在合并改动之前，你可以使用如下命令预览差异：
```
git diff <source_branch> <target_branch>
```
+ 替换本地改动

假如你操作失误（当然，这最好永远不要发生），你可以使用如下命令替换掉本地改动：
git checkout -- <filename>
此命令会使用 HEAD 中的最新内容替换掉你的工作目录中的文件。已添加到暂存区的改动以及新文件都不会受到影响。

假如你想丢弃你在本地的所有改动与提交，可以到服务器上获取最新的版本历史，并将你本地主分支指向它：
```
git fetch origin
git reset --hard origin/master
```
## 2. 远端仓库操作
第一次提交到github仓库
```
git remote add origin git@github.com:xxxxxx/XXXXXnual.git
git push -u origin main
```
第二次提交到github仓库
```
git branch -M main
git pull
git push -u origin main
```
eg:
```
yp@AlenY:~/workdir/python$ git add ./*
yp@AlenY:~/workdir/python$ git commit -m "20210419"
[main efdb465] 20210419
 2 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 github_manual.md
yp@AlenY:~/workdir/python$ git pull
已经是最新的。
yp@AlenY:~/workdir/python$ git push -u origin main
对象计数中: 4, 完成.
Delta compression using up to 16 threads.
压缩对象中: 100% (4/4), 完成.
写入对象中: 100% (4/4), 2.56 KiB | 2.56 MiB/s, 完成.
Total 4 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:GotWind/Python-Manual.git
   761bf8e..efdb465  main -> main
分支 'main' 设置为跟踪来自 'origin' 的远程分支 'main'。
```

# 3. pull与push
上传到远端时，如果远端发生了变化且本地还没有将变化pull下来的话不能直接push，会报错，需要先pull了远端的变化之后再push
```
yp@AlenY:~/workdir/python$ git push
To github.com:GotWind/Python-Manual.git
 ! [rejected]        main -> main (fetch first)
error: 无法推送一些引用到 'git@github.com:GotWind/Python-Manual.git'
提示：更新被拒绝，因为远程仓库包含您本地尚不存在的提交。这通常是因为另外
提示：一个仓库已向该引用进行了推送。再次推送前，您可能需要先整合远程变更
提示：（如 'git pull ...'）。
提示：详见 'git push --help' 中的 'Note about fast-forwards' 小节。

yp@AlenY:~/workdir/python$ git pull
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 2 (delta 1), reused 0 (delta 0), pack-reused 0
展开对象中: 100% (2/2), 完成.
来自 github.com:GotWind/Python-Manual
   dd02591..4397099  main       -> origin/main
删除 ota_from_target_files
Merge made by the 'recursive' strategy.
 ota_from_target_files | 2473 --------------------------------------------------------------------------------------------------------------------------------------------------------
 1 file changed, 2473 deletions(-)
 delete mode 100755 ota_from_target_files

yp@AlenY:~/workdir/python$ git push
对象计数中: 8, 完成.
Delta compression using up to 16 threads.
压缩对象中: 100% (8/8), 完成.
写入对象中: 100% (8/8), 1.10 KiB | 1.10 MiB/s, 完成.
Total 8 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 1 local object.
To github.com:GotWind/Python-Manual.git
   4397099..e3181ba  main -> main

```

# 4.下载远程master分支，修改代码后提交到master
注意，自己笔记本是选项 -o machrive 笔记本的虚拟机是 -o vm  额外的还有 -o ts
```
aleny@Aleny:~$ git clone -o vm git@github.com:GotWind/note.git
aleny@Aleny:~$ cd note/
aleny@Aleny:~/note$ vim github-summary.md
aleny@Aleny:~/note$ git add *
aleny@Aleny:~/note$ git commit -m "mv@2021-05-06 23:50"
[master 6c80a28] mv@2021-05-06 23:50
 1 file changed, 3 insertions(+), 1 deletion(-)
aleny@Aleny:~/note$ git push

```
# 5.删除本地还存在但远端不存在的分支
```
git fetch -p
```
```
aleny@Aleny:~/note$ git branch -a
* master
  remotes/vm/HEAD -> vm/master
  remotes/vm/main
  remotes/vm/master
aleny@Aleny:~/note$ git fetch -p
来自 github.com:GotWind/note
 - [已删除]          （无）  -> vm/main
```

# 6.生成patch和使用patch
注意在生成patch和使用patch的过程中包含三次提交  
(1)初始化仓库新建文件并提交一次
```
git init 
vim data/111.log
git add --all
git commit -m "1st commit"
```
(2)修改过后再提交一次
```
vim data/222.log
git add --all
git commit -m "2nd commit"
```
(3)前面已经有两次提交了，可以通过前面的两次提交生成一个patch
```
git format-patch HEAD^
```
(4)撤销第二次的修改(在其他地方可能只有第一次提交，即恢复到第一次提交的状态)
```
rm data/222.log
git commit -m "3rd commit"
```
(5)使用patch  
```
(a)下面这一条会验证patch是否可用，不可用会有打印信息  
git apply --check 0001-2021-05-26-11-32-30-2nd-commoit.patch  
(b)直接将patch文件的内容打到对应的版本中  
git am 0001-2021-05-26-11-32-30-2nd-commoit.patch
```

(6)注意：对于使用git diff生成的patch需要直接apply，与上面的方式不一样
```
git apply xxx.patch
```