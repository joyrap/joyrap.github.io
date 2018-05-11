GIT技巧
===========

## 开发分支部分文件合并发布分支

分支并行开发，而在上线前有可能某个分支的开发或测试还没有完成，又或者是产品调整，
取消了该分支功能的上线计划，我们在release前不合并该分支即可，然而如果该分支中的某些小调整却需要上线，
我们就需要把其中的部分文件合并到release分支。

- 1.切换到开发分支XXX，commit所有修改
- 2.切换到发布分支release,git pull
- 3.git checkout XXX filename (checkout开发分支XXX需要合并的文件)
- 4.git commit -a -m "提交日志"
