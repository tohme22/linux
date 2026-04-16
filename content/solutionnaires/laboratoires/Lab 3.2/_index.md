---
title: "Laboratoire 3.2"
description: "linux"
draft: false
weight: 4
---
## Laboratoire 3.2 -  Solution

Question 1: 
```cmd 
mkdir -p Documents/project_plans
touch Documents/project_plans/season{1,2}_project_plan.odf
tree Documents
```

Question 2:
```cmd 
touch tv_season{1..2}_episode{1..6}.ogg
ls tv*
```

Question 3:
```cmd 
touch mystery_chapter{1..8}.odf
ls mys*
```

Question 4:
```cmd 
mkdir Videos/season{1..2}
tree Videos
```

Question 5:
```cmd
mv tv_season1* Videos/season1
mv tv_season2* Videos/season2
tree Videos
```

Question 6:
```cmd 
mkdir -p Documents/my_bestseller/chapters
tree Documents
```

Question 7:
```cmd 
mkdir Documents/my_bestseller/{editor,changes,vacation}
tree Documents
```

Question 8:
```cmd 
cd Documents/my_bestseller/chapters
pwd
mv ~/mystery_chapter* .
tree
```

Question 9:
```cmd 
mv mystery_chapter{1..2}.odf ../editor
tree ../editor
```

Question 10:
```cmd 
mv mystery_chapter{7,8}.odf ../vacation
tree ../vacation
```

Question 11:
```cmd 
cd ~/Videos/season2
cp *episode1.ogg ~/Documents/my_bestseller/vacation
ls ~/Documents/my_bestseller/vacation
```

Question 12:
```cmd 
cd ~/Documents/my_bestseller/vacation
pwd 
ls
cd -
pwd
cp *episode2.ogg ~/Documents/my_bestseller/vacation
ls ~/Documents/my_bestseller/vacation
cd -
pwd
ls
```

Question 13:
```cmd 
cd ~/Documents/my_bestseller
cp chapters/mystery_chapter[56].odf changes
tree changes
```

Question 14:
```cmd 
cd changes
cp mystery_chapter5.odf mystery_chapter5_$(date +%F).odf
cp mystery_chapter5.odf mystery_chapter5_$(date +%s).odf
tree
```

Question 15:
```cmd 
rm mystery*
cd ..
rm changes 
rmdir changes
ls
```

Question 16:
```cmd 
rm -r vacation
ls
cd
```





