package org.csu.mall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("csumall_user")
public class User {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private String username;
    private String password;
    private String email;
    private String phone;
    private String question;
    private String answer;
    private Integer role;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;

}
