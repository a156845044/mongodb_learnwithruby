# ruby 

20分钟上手ruby [传送门](https://www.ruby-lang.org/zh_cn/documentation/quickstart/)

rubygems

```base
gem install mongo
```

还原
```base
bundle install
```

设置gem 镜像

gem 镜像

1.官方网关 https://rubygems.org/   

2.中国区网关 https://gems.ruby-china.com    (https://gems.ruby-china.org 这个网站因为备案问题无法访问，改用com 后缀 )

3.淘宝网关 https://ruby.taobao.org/

```base
$ gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
$ gem sources -l
*** CURRENT SOURCES ***

https://gems.ruby-china.com
# 请确保只有 gems.ruby-china.com
```

# Ruby on Rails --[tutorial](https://api.rubyonrails.org/)

 Rails, 是一个使用 Ruby 语言写的开源 Web 开发框架。

安装方法

```base
$  gem install rails

```

使用方法
```base
$  rails new myapp
```
Change directory to myapp and start the web server:
```base
$ cd myapp
$ rails server  
```


# irb

shell 方式启动mongodb 连接
```base
irb -r ./connect.rb
```

添加：
```base
smith = {"last_name"=>"smith","age"=>30}
smith_id = $users.insert_one(smith)
```
查询

```base
$users.find().each do |user|
puts user
end
```
更新

```base

$users.find({"last_name"=>"smith"}).update_one({"$set"=> {"city"=>"上海"}});

```

删除

```base
$users.find({...}).delete_one //单个

$users.find({...}).delete_many //批量

$users.drop //删除所有剩余的文档
```

数据库命令

查询所有数据库
```base
$admin_db = $client.use('admin')

$admin_db.command("listDatabases" => 1})
```
