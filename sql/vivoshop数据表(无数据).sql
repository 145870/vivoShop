DROP DATABASE vivoshop;

CREATE DATABASE vivoshop;

USE vivoshop;

-- 产品类别表
CREATE TABLE products_class (
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  class_name VARCHAR(50) DEFAULT '' NOT NULL COMMENT '类别名称',
  PRIMARY KEY (id)
);

-- 产品表
CREATE TABLE products_information (
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  information_name VARCHAR(50) DEFAULT '' NOT NULL COMMENT '产品名称',
  description VARCHAR(120) DEFAULT '' NOT NULL COMMENT '产品描述',
  class_id INT(11) NOT NULL COMMENT '分类id',
  information_status TINYINT(1) NOT NULL DEFAULT 1 COMMENT '上架状态 0：已上架 1：未上架 2：已下架',
  is_last TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否新品 0:是 1:否',
  create_time DATETIME NOT NULL DEFAULT NOW() COMMENT '创建时间',
  shelves_time DATETIME NOT NULL COMMENT '上架时间',
  PRIMARY KEY (id)
);

-- 产品图片表
CREATE TABLE products_images_url (
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  information_id INT(10) NOT NULL COMMENT '产品id',
  class_name TINYINT(1) NOT NULL DEFAULT 0 COMMENT '类别 0:缩略图 1:大图 2:介绍图',
  url VARCHAR(100) NOT NULL  DEFAULT '' COMMENT '图片路径',
  create_time DATETIME NOT NULL DEFAULT NOW() COMMENT '创建时间',
  PRIMARY KEY (id)
);

-- 产品规格
CREATE TABLE products_specifications (
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  information_id INT(11) NOT NULL COMMENT '产品id',
  specifications_name VARCHAR(50) NOT NULL DEFAULT '' COMMENT '规格名称',
  PRIMARY KEY (id)
);

-- 产品规格详细表
CREATE TABLE products_specifications_detailed (
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  specifications_id INT(11) NOT NULL COMMENT '规格id',
  detailed_value VARCHAR(20) NOT NULL DEFAULT '' COMMENT '规格值',
  PRIMARY KEY (id)
);

-- 价格表
CREATE TABLE price (
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  price DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '价格',
  PRIMARY KEY (id)
);

-- 价格组合表
CREATE TABLE price_combo (
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  price_id INT(10) NOT NULL DEFAULT 0 COMMENT '价格id',
  specifications_detailed_id INT(10) NOT NULL COMMENT '规格详细id',
  PRIMARY KEY (id)
);

-- 库存信息
CREATE TABLE inventory_details (
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  information_id INT(10) NOT NULL COMMENT '产品id',
  specifications_detailed_id INT(11) NOT NULL COMMENT '规格详细id',
  quantity INT NOT NULL DEFAULT 0 COMMENT '每种规格搭配的库存数量',
  PRIMARY KEY (id)
);

-- 库存变动表
CREATE TABLE inventory_update (
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  inventory_details_id INT(10) NOT NULL COMMENT '库存id',
  update_type TINYINT(1) NOT NULL DEFAULT 0 COMMENT '变动类型 0:入库 1:出库 2:调整',
  update_time DATETIME NOT NULL DEFAULT NOW() COMMENT '变动时间',
  old_quantity INT NOT NULL DEFAULT 0 COMMENT '变动前数量数量',
  new_quantity INT NOT NULL DEFAULT 0 COMMENT '变动后数量',
  admin_id INT(10) NOT NULL COMMENT '操作员id',
  PRIMARY KEY (id)
);

-- 用户资料表
CREATE TABLE user_profile (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    account_number VARCHAR(30) NOT NULL DEFAULT '' COMMENT '用户账户',
    user_name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
    phone VARCHAR(20) NOT NULL DEFAULT '' COMMENT '手机号',
    user_password VARCHAR(20) NOT NULL DEFAULT '' COMMENT '密码',
    mailbox VARCHAR(50) DEFAULT '' COMMENT '邮箱',
    address VARCHAR(50) DEFAULT '' COMMENT '地址',
    sex TINYINT(1) NOT NULL DEFAULT 0 COMMENT '性别 (0:男, 1:女)',
    birthday DATETIME NOT NULL COMMENT '生日',
    create_time DATETIME DEFAULT NOW() NOT NULL COMMENT '注册时间',
    head_image_url VARCHAR(100) NOT NULL DEFAULT '' COMMENT '头像路径'
);

-- 用户密保表
CREATE TABLE user_security (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    user_id INT(10) NOT NULL COMMENT '用户id',
    problem VARCHAR(50) NOT NULL DEFAULT '' COMMENT '问题',
    answer VARCHAR(50) NOT NULL DEFAULT '' COMMENT '答案'
);

-- 用户足迹表
CREATE TABLE user_footprint (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    user_id INT(20) NOT NULL COMMENT '用户id',
    information_id INT(10) NOT NULL COMMENT '浏览产品id',
    Footprint_time DATETIME DEFAULT NOW() NOT NULL COMMENT '浏览时间'
);

-- 用户收藏表
CREATE TABLE user_collect (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    user_id INT(20) NOT NULL COMMENT '用户id',
    information_id INT(20) NOT NULL COMMENT '产品id',
    collect_time DATETIME DEFAULT NOW() NOT NULL COMMENT '收藏时间'
);

-- 购物车表
CREATE TABLE user_shopping_cart (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    user_id INT(20) NOT NULL COMMENT '用户id',
    information_id INT(10) NOT NULL COMMENT '产品id',
    specifications_detailed_id INT(10) DEFAULT 0 NOT NULL COMMENT '规格详细id',
    quantity INT NOT NULL DEFAULT 0 COMMENT '数量'
);

#用户评论表
CREATE TABLE comments (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    user_id INT(20) NOT NULL COMMENT '用户id',
    information_id INT(20) NOT NULL COMMENT '产品id',
    rating TINYINT(1) DEFAULT 5 NOT NULL COMMENT '评分 (1-5)',
    content VARCHAR(255) NOT NULL DEFAULT '' COMMENT '评论内容',
    reply VARCHAR(255) COMMENT '官方回复',
    comment_time DATETIME DEFAULT NOW() NOT NULL COMMENT '评价时间'
);

-- 评论点赞表
CREATE TABLE comments_like (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    comments_id INT(20) NOT NULL COMMENT '评价id',
    user_id INT(20) NOT NULL COMMENT '点赞用户id',
    like_time DATETIME DEFAULT NOW() NOT NULL COMMENT '点赞时间'
);

-- 评论图片视频内容表
CREATE TABLE comments_media_files (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    comments_id INT(20) NOT NULL COMMENT '评价id',
    image_or_video_url VARCHAR(100) NOT NULL DEFAULT '' COMMENT '用户评价图片视频url'
);

-- 用户配送地址信息表
CREATE TABLE user_address_information (
    id INT PRIMARY KEY COMMENT '地址ID',
    user_id INT NOT NULL COMMENT '用户ID',
    address_name VARCHAR(50) NOT NULL DEFAULT '' COMMENT '收件人姓名',
    phone VARCHAR(20) NOT NULL DEFAULT '' COMMENT '收件人电话号码',
    province VARCHAR(20) NOT NULL DEFAULT '' COMMENT '省份',
    city VARCHAR(20) NOT NULL DEFAULT '' COMMENT '城市',
    district VARCHAR(20) NOT NULL DEFAULT '' COMMENT '区/县',
    address VARCHAR(100) NOT NULL DEFAULT '' COMMENT '详细地址信息',
    is_default TINYINT(1) DEFAULT 0 NOT NULL COMMENT '默认地址 (0:是, 1:否)'
);

-- 订单售后服务表
CREATE TABLE orders_service (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    reason VARCHAR(255) NOT NULL COMMENT '原因',
    service_type TINYINT(1) NOT NULL DEFAULT 1 COMMENT '售后类型 (0:换货, 1:退货, 2:维修)',
    create_time DATETIME DEFAULT NOW() NOT NULL COMMENT '申请时间',
    admin_id INT(10) NOT NULL COMMENT '处理人id',
    service_status TINYINT(1) DEFAULT 0 NOT NULL COMMENT '售后状态 (0:已完成, 1:进行中)',
    complete_time DATETIME COMMENT '完成时间'
);

-- 订单表
CREATE TABLE orders (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    user_id INT(11) NOT NULL COMMENT '用户id',
    address_name VARCHAR(50) NOT NULL DEFAULT '' COMMENT '收件人姓名',
    phone VARCHAR(20) NOT NULL DEFAULT '' COMMENT '收件人电话号码',
    province VARCHAR(20) NOT NULL DEFAULT '' COMMENT '省份',
    city VARCHAR(20) NOT NULL DEFAULT '' COMMENT '城市',
    district VARCHAR(20) NOT NULL DEFAULT '' COMMENT '区/县',
    address VARCHAR(100) NOT NULL DEFAULT '' COMMENT '详细地址信息',
    create_time DATETIME DEFAULT NOW() NOT NULL COMMENT '订单创建时间',
    orders_status TINYINT(1) DEFAULT 0 NOT NULL COMMENT '订单状态 (0:未支付, 1:未发货, 2:已发货, 3:已收货)',
    service_id BIGINT(20) DEFAULT 0 COMMENT '售后id',
    FOREIGN KEY (service_id) REFERENCES orders_service(id)
);

-- 订单明细表
CREATE TABLE orders_details (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    order_id INT(11) NOT NULL COMMENT '订单id',
    specifications_detailed_id INT(11) NOT NULL COMMENT '产品规格详细id',
    quantity INT NOT NULL DEFAULT 1 COMMENT '购买数量'
);

-- 主页设置表
CREATE TABLE home_page_settings (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    carousel_chart_type TINYINT(1) NOT NULL DEFAULT 0 COMMENT '轮播展示类型 (0:新品, 1:热门)',
    carousel_chart_quantity INT NOT NULL DEFAULT 4 COMMENT '轮播展示数量',
    like_quantity INT NOT NULL DEFAULT 10 COMMENT '猜你喜欢展示数量'
);

-- 广告通知设置表
CREATE TABLE ad_notification_settings (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    user_id INT(10) NOT NULL COMMENT '用户id',
    method TINYINT(1) NOT NULL DEFAULT 0 COMMENT '提醒方式 (0:全部, 1:短信, 2:邮箱)',
    settings TINYINT(1) DEFAULT 0 NOT NULL COMMENT '用户是否接受通知 (0:yes, 1:no)'
);

-- 管理员类别表
CREATE TABLE admin_type (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    type_name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '类型名称'
);

-- 管理员表
CREATE TABLE admin (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    admin_name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '姓名',
    admin_password VARCHAR(20) NOT NULL DEFAULT '' COMMENT '密码',
    admin_type_id INT(10) NOT NULL COMMENT '权限类别id',
    create_time DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间'
);

-- 日志表
CREATE TABLE vivo_log (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    admin_id INT(20) NOT NULL COMMENT '管理员id',
    log_time DATETIME NOT NULL COMMENT '产生时间',
    module VARCHAR(20) NOT NULL DEFAULT '' COMMENT '事件发生位置',
    log_type TINYINT(1) NOT NULL COMMENT '操作类型 (0:添加, 1:删除, 2:修改)',
    details VARCHAR(255) NOT NULL DEFAULT '' COMMENT '操作描述',
    sensitive_operation TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否敏感 (0:敏感, 1:不敏感)'
);