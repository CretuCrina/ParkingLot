package com.parking.parkinglot.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "car_photo_1")
public class CarPhoto {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false)
    private Long id;


    String filename;
    String fileType;
    byte[] fileContent;

    @OneToOne
    @JoinColumn(name = "car_id", nullable = false)
    private Car car;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    @OneToOne
    public Car getCar() {
        return car;
    }

    public byte[] getFileContent() {
        return fileContent;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public void setFileContent(byte[] fileContent) {
        this.fileContent = fileContent;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
}