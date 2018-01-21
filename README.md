# chuxin-generator

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
