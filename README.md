# chuxin-generator

## Post Format Sample 文章格式示例
目前使用的 Hugo 支持 Markdown Front Matter 语法 https://jekyllrb.com/docs/frontmatter/ ，
主要涉及 title、date、tags、categories四个变量，
也就是 .md 文件的开头需要包含如下内容。
```
---
title: Post Format Sample 文章格式示例
date: 2018-01-30 17:54:55
tags: [test]
categories: test
---
```
需要注意 Hugo 按照 .md 文件中的 date 变量排序，如果不写或者格式错误，那么就会被排在最后了。
可以在 GitHub 中预览 Markdown Front Matter 语法是否正确，例如上例预览效果为：

| title | date | tags | categories |
| - | - | - |-|
| Post Format Sample 文章格式示例 | 2018-01-30 09:54:55 `-0800` | test | test |

预览中在 date 变量看到时区，也就是 `-0800` 或者类似的字样代表正确。

## Update Procedure
### Preparation
create a docker image named 'ssh-github'
https://github.com/huzhenghui/Connecting-to-GitHub-with-SSH
### Steps
```bash
git clone https://github.com/daonao/chuxin-generator.git
cd chuxin-generator
docker run --rm --entrypoint /bin/sh ssh-github -c "$(cat gohugo-site\gohugo-docker-commands.sh)"
```

## Add Source Procedure Sample (Manual now, should convert to a semi-automatic script)
```bash
docker run -it --rm --entrypoint /bin/sh ssh-github
```
```bash
git clone git@github.com:daonao/chuxin-generator.git
cd chuxin-generator
git submodule add -b master https://github.com/huzhenghui/public-article.git content/huzhenghui/public-article
cd content-posts
ln -s ../content/huzhenghui/public-article/posts/ huzhenghui
cd ..
git add .
git commit -m 'add https://github.com/huzhenghui/public-article.git'
git push origin master
```

## Step 4 : Generate content
https://github.com/daonao/chuxin-generator/commit/1f1cb85182992dd7b0c509346d366af150d67dfd
### You can generate content by the commands below
#### generate
```bash
git clone git@github.com:daonao/chuxin-generator.git
cd chuxin-generator
git submodule update --init
git submodule foreach git checkout master
cd gohugo-site
./gohugo-generate.sh
```
#### Test (optional)
```bash
hugo server -D
```
#### Submit
```bash
cd ../public-repository
git add .
git commit -m 'generate content'
git push origin master
```
### Operation commands for this step
```bash
git clone git@github.com:daonao/chuxin-generator.git
cd chuxin-generator
git submodule add -b master git@github.com:daonao/chuxin.git public-repository
mkdir public-repository/public
cd gohugo-site
ln -s ../public-repository/docs public
touch public/.gitkeep
```

## Step 3 : Play local
https://github.com/daonao/chuxin-generator/commit/29cb73fb3fd181a26015e4de9c023410736e3984
### You can play locally by the commands below
```bash
git clone git@github.com:daonao/chuxin-generator.git
cd chuxin-generator
git submodule update --init
cd gohugo-site
./gohugo-generate.sh
hugo server -D
```
### Operation commands for this step
```bash
git clone git@github.com:daonao/chuxin-generator.git
cd chuxin-generator
git submodule add -b master https://github.com/Thinkgamer/GitBlog.git content/Thinkgamer/GitBlog
git submodule add -b next https://github.com/kongqw/kongqw.github.io.git content/kongqw/kongqw.github.io
mkdir -p gohugo-site/content/posts
cd gohugo-site/content/posts
ln -s ../../../content/Thinkgamer/GitBlog/source/_posts Thinkgamer
ln -s ../../../content/kongqw/kongqw.github.io/source/_posts kongqw
cd ../../..
touch gohugo-site/gohugo-generate.sh
chmod u+x gohugo-site/gohugo-generate.sh
```

## Step 2 : import theme
https://github.com/daonao/chuxin-generator/commit/aaebb8f4bb61aba7be6c80c780a50018a4c95f9f
### Operation commands for this step
```bash
git clone git@github.com:daonao/chuxin-generator.git
cd chuxin-generator
git submodule add https://github.com/budparr/gohugo-theme-ananke.git gohugo-themes/budparr/gohugo-theme-ananke
mkdir gohugo-site/themes
cd gohugo-site/themes
ln -s ../../gohugo-themes/budparr/gohugo-theme-ananke ananke
cd ..
echo 'theme = "ananke"' >> config.toml
cd ..
git add .
git commit -m 'theme'
git push origin master
```

## Step 1 : create new hugo site
https://github.com/daonao/chuxin-generator/commit/e71e131d20edcf4809fda599818ec75bb8dd34b1
### Operation commands for this step
```bash
git clone git@github.com:daonao/chuxin-generator.git
cd chuxin-generator
hugo new site gohugo-site
git add .
git commit -m 'hugo new site gohugo-site'
git push origin master
```
