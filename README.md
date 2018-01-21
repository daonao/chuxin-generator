# chuxin-generator

## Step 2
https://github.com/daonao/chuxin-generator/commit/aaebb8f4bb61aba7be6c80c780a50018a4c95f9f
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

## Step 1
https://github.com/daonao/chuxin-generator/commit/e71e131d20edcf4809fda599818ec75bb8dd34b1
```bash
git clone git@github.com:daonao/chuxin-generator.git
cd chuxin-generator
hugo new site gohugo-site
git add .
git commit -m 'hugo new site gohugo-site'
git push origin master
```
