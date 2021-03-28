package org.csu.mall.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.mall.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper extends BaseMapper<User> {
}
