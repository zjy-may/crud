-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE seckill ;

-- 使用数据库
use seckill ;

-- 创建秒杀库存表
CREATE TABLE seckill(
  `seckill_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '商品库存ID' ,
  `name` VARCHAR(120) NOT NULL COMMENT '商品名称' ,
  `number` INT NOT NULL COMMENT '库存数量' ,
  `start_time` TIMESTAMP NOT NULL COMMENT '秒杀开启时间' ,
  `end_time` TIMESTAMP NOT NULL COMMENT '秒杀结束时间' ,
  `create_time` TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
  PRIMARY KEY (seckill_id) ,
  KEY idx_start_time(start_time) ,
  KEY idx_end_time(end_time) ,
  KEY idx_create_time(create_time)
)ENGINE = InnoDB AUTO_INCREMENT = 1000 DEFAULT CHARSET = utf8 COMMENT = '秒杀库存表' ;

-- 初始化数据
INSERT INTO seckill(name , number , start_time , end_time)
VALUES
  ('1000元秒杀MacBook Air' , 100 , '2018-09-11 11:01:01' , '2018-09-12 11:01:01') ,
  ('2000元秒杀MacBook' , 200 , '2018-09-11 11:01:01' , '2018-09-12 11:01:01') ,
  ('3000元秒杀MacBook Pro' , 300 , '2018-09-11 11:01:01' , '2018-09-12 11:01:01') ,
  ('4000元秒杀iMac' , 400 , '2018-09-11 11:01:01' , '2018-09-12 11:01:01') ;

-- 秒杀成功明细表
-- 用户登录认证相关信息
CREATE TABLE success_killed(
  `seckill_id` BIGINT NOT NULL COMMENT '秒杀商品ID' ,
  `user_phone` BIGINT NOT NULL COMMENT '用户手机号' ,
  `state` TINYINT NOT NULL DEFAULT -1 COMMENT '状态标识:-1:无效 0:成功 1:已付款 2：已发货' ,
  `create_time` TIMESTAMP NOT NULL COMMENT '创建时间' ,
  PRIMARY KEY (seckill_id , user_phone) /*联合主键*/ ,
  KEY idx_create_time(create_time)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '秒杀成功明细表' ;
