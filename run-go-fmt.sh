#!/bin/sh


# 获取有变化的文件
STAGED_GO_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep ".go$")

if [[ "$STAGED_GO_FILES" = "" ]]; then
    exit 0
fi

PASS=true

for FILE in $STAGED_GO_FILES
do
  # gofmt 格式化修改代码
    FORMAT_FILE=$(gofmt -l $FILE)
    if [[ "$FORMAT_FILE" != "" ]];then
        FORMATFILE=$(gofmt -l -w -s $PWD/$FORMAT_FILE)
        if [[ $? != 0 ]]; then
            PASS=false
            break
        fi
        printf "\033[32m FORMAT: %s\033[0m\n" $FORMATFILE
    fi

    # 此处将更改提交至暂存区
    git add $FILE

done

if ! $PASS; then
    printf "\033[31m COMMIT FAILED \033[0m\n"
    exit 1
else
    printf "\033[32m COMMIT SUCCEEDED \033[0m\n"
fi

exit 0
