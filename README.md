# pre-commit-golang

## [pre-commit](https://pre-commit.com/)

A framework for managing and maintaining multi-language pre-commit hooks.

## 仓库
```
.
├── README.md  
└── run-go-fmt.sh               ## 执行脚本
└── .pre-commit-hooks.yaml      ## hook配置
└── .pre-commmit-config.yaml    ## 工程的配置
└── .sample-pre-commmit-config.yaml    ## 样例配置

```
## 流程
1. 安装pre-commit工具
```
pip install pre-commit

```
2. 拷贝.sample-pre-commmit-config.yaml文件的内容到工程目录根目录，命名为.pre-commmit-config.yaml
3. 进入工程，安装步骤二配置的插件【shell脚本打入.git/hook】
```
pre-commit install
```
4. 安装完成，提交代码自动触发脚本
```
git add .
git commit -m'feat:提交‘
```
## TODO
集成常用构建脚本
