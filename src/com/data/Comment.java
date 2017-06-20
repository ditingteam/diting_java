package com.data;

import java.util.Date;

public class Comment {
    private Integer id;
    private Integer videoLinkId;
    private Integer userId;
    private Date date;
    private String comment;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVideoLinkId() {
        return videoLinkId;
    }

    public void setVideoLinkId(Integer videoLinkId) {
        this.videoLinkId = videoLinkId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
