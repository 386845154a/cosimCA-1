package com.casic.datadriver.model.modelcenter;

import com.hotent.core.model.BaseModel;

/**
 * Created by 忠 on 2017/2/28.
 */
public class ModelCenterModel extends BaseModel {
    private Long DdModelId;

    private String ddModelName;

    private String ddModelExplain;

    private Long ddTaskId;

    private String ddModelUrl;

    private Long ddModelType;

    private String ddModelVersion;

    private String ddModelBf1;

    private Long ddModelBf2;

    public String getDdModelVersion() {
        return ddModelVersion;
    }

    public void setDdModelVersion(String ddModelVersion) {
        this.ddModelVersion = ddModelVersion;
    }

    public Long getDdModelId() {
        return DdModelId;
    }

    public void setDdModelId(Long DdModelId) {
        this.DdModelId = DdModelId;
    }

    public String getDdModelName() {
        return ddModelName;
    }

    public void setDdModelName(String ddModelName) {
        this.ddModelName = ddModelName == null ? null : ddModelName.trim();
    }

    public String getDdModelExplain() {
        return ddModelExplain;
    }

    public void setDdModelExplain(String ddModelExplain) {
        this.ddModelExplain = ddModelExplain == null ? null : ddModelExplain.trim();
    }

    public Long getDdTaskId() {
        return ddTaskId;
    }

    public void setDdTaskId(Long ddTaskId) {
        this.ddTaskId = ddTaskId;
    }

    public String getDdModelUrl() {
        return ddModelUrl;
    }

    public void setDdModelUrl(String ddModelUrl) {
        this.ddModelUrl = ddModelUrl == null ? null : ddModelUrl.trim();
    }

    public Long getDdModelType() {
        return ddModelType;
    }

    public void setDdModelType(Long ddModelType) {
        this.ddModelType = ddModelType;
    }

    public String getDdModelBf1() {
        return ddModelBf1;
    }

    public void setDdModelBf1(String ddModelBf1) {
        this.ddModelBf1 = ddModelBf1 == null ? null : ddModelBf1.trim();
    }

    public Long getDdModelBf2() {
        return ddModelBf2;
    }

    public void setDdModelBf2(Long ddModelBf2) {
        this.ddModelBf2 = ddModelBf2;
    }
}
