package org.seckill.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dao.SeckillDao;
import org.seckill.entity.Seckill;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/spring/*.xml"})
public class SeckillServiceTest {

    @Autowired
    private SeckillDao seckillDao;

    private static final Logger logger = LoggerFactory.getLogger(SeckillServiceTest.class);

    @Test
    public void getSeckillList() {
        List<Seckill> seckills = seckillDao.queryAll(0, 10);
        logger.info("====> " + seckills);
    }
}