package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "examinationDocuments")
public class ExaminationDocuments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer examinationId;

    @Lob
    private byte[] fileData;

    private String fileName;
    private String fileContentType;
    private Integer isActive;

    public ExaminationDocuments() {
        super();
        // TODO Auto-generated constructor stub
    }

    public ExaminationDocuments(Integer examinationId, String fileName, byte[] fileData, String fileContentType, Integer isActive) {
        this.examinationId = examinationId;
        this.fileName = fileName;
        this.fileData = fileData;
        this.fileContentType = fileContentType;
        this.isActive = isActive;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getExaminationId() {
        return examinationId;
    }

    public void setExaminationId(Integer examinationId) {
        this.examinationId = examinationId;
    }

    public byte[] getFileData() {
        return fileData;
    }

    public void setFileData(byte[] fileData) {
        this.fileData = fileData;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getIsActive() {
        return isActive;
    }

    public void setIsActive(Integer isActive) {
        this.isActive = isActive;
    }
}
