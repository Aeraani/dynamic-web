package com.multi.model.vo;

public class WriteVO {
    private String category;
    private String title;
    private String tagInput;
    private String content;
    private String attachments; //첨부파일

    public WriteVO() {
    }

    public WriteVO(String category, String title, String tagInput, String content, String attachments) {
        this.category = category;
        this.title = title;
        this.tagInput = tagInput;
        this.content = content;
        this.attachments = attachments;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTagInput() {
        return tagInput;
    }

    public void setTagInput(String tagInput) {
        this.tagInput = tagInput;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAttachments() {
        return attachments;
    }

    public void setAttachments(String attachments) {
        this.attachments = attachments;
    }

    @Override
    public String toString() {
        return "WriteVO{" +
                "category='" + category + '\'' +
                ", title='" + title + '\'' +
                ", tagInput='" + tagInput + '\'' +
                ", content='" + content + '\'' +
                ", attachments='" + attachments + '\'' +
                '}';
    }
}
