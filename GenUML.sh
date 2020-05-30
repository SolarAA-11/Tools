#!/usr/bin/env bash

# plantuml.jar 路径
pathPUMLJar="D:\\tools\\plantuml.jar"

# include 搜索路径
searchPath="D:\\tools\\plantuml-style-c4"

# 变量目录 生成 UML PNG
function GenerateUMLPng() {
    # $1 当前遍历的目录
    # 遍历当前目录下所有文件和文件夹
    for element in `ls $1`
    do
        absolutePath="$1/$element"
        if [ -d $absolutePath ]; then
            # 当前为目录 递归
            GenerateUMLPng $absolutePath
        elif [ ${element#*.} = "puml" ]; then
            # 为 puml 文件
            echo $absolutePath
            # 生成 UML PNG
            java -Dplantuml.include.path=$searchPath -jar $pathPUMLJar -charset UTF-8 $absolutePath
        fi
    done
}

GenerateUMLPng "."
