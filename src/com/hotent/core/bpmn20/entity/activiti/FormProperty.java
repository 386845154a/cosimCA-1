//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 in JDK 6 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2013.03.13 at 10:40:06 ���� CST 
//


package com.hotent.core.bpmn20.entity.activiti;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="value" maxOccurs="unbounded" minOccurs="0">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;attribute name="id" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="name" type="{http://www.w3.org/2001/XMLSchema}string" />
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *       &lt;/sequence>
 *       &lt;attribute name="id" use="required" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="name" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="type" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="readable" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="writable" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="required" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="variable" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="expression" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="datePattern" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="value" type="{http://activiti.org/bpmn}tExpression" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "value"
})
@XmlRootElement(name = "formProperty")
public class FormProperty {

    protected List<Value> value;
    @XmlAttribute(required = true)
    protected String id;
    @XmlAttribute
    protected String name;
    @XmlAttribute
    protected String type;
    @XmlAttribute
    protected String readable;
    @XmlAttribute
    protected String writable;
    @XmlAttribute
    protected String required;
    @XmlAttribute
    protected String variable;
    @XmlAttribute
    protected String expression;
    @XmlAttribute
    protected String datePattern;
    @XmlAttribute(name = "value")
    protected String attrValue;

    /**
     * Gets the value of the value property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the value property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getValue().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Value }
     * 
     * 
     */
    public List<Value> getValue() {
        if (value == null) {
            value = new ArrayList<Value>();
        }
        return this.value;
    }

    /**
     * Gets the value of the id property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getId() {
        return id;
    }

    /**
     * Sets the value of the id property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setId(String value) {
        this.id = value;
    }

    /**
     * Gets the value of the name property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the value of the name property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setName(String value) {
        this.name = value;
    }

    /**
     * Gets the value of the type property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setType(String value) {
        this.type = value;
    }

    /**
     * Gets the value of the readable property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReadable() {
        return readable;
    }

    /**
     * Sets the value of the readable property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReadable(String value) {
        this.readable = value;
    }

    /**
     * Gets the value of the writable property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getWritable() {
        return writable;
    }

    /**
     * Sets the value of the writable property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setWritable(String value) {
        this.writable = value;
    }

    /**
     * Gets the value of the required property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRequired() {
        return required;
    }

    /**
     * Sets the value of the required property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRequired(String value) {
        this.required = value;
    }

    /**
     * Gets the value of the variable property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getVariable() {
        return variable;
    }

    /**
     * Sets the value of the variable property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setVariable(String value) {
        this.variable = value;
    }

    /**
     * Gets the value of the expression property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getExpression() {
        return expression;
    }

    /**
     * Sets the value of the expression property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setExpression(String value) {
        this.expression = value;
    }

    /**
     * Gets the value of the datePattern property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDatePattern() {
        return datePattern;
    }

    /**
     * Sets the value of the datePattern property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDatePattern(String value) {
        this.datePattern = value;
    }

    /**
     * Gets the value of the attrValue property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAttrValue() {
        return attrValue;
    }

    /**
     * Sets the value of the attrValue property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAttrValue(String value) {
        this.attrValue = value;
    }


    /**
     * <p>Java class for anonymous complex type.
     * 
     * <p>The following schema fragment specifies the expected content contained within this class.
     * 
     * <pre>
     * &lt;complexType>
     *   &lt;complexContent>
     *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       &lt;attribute name="id" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="name" type="{http://www.w3.org/2001/XMLSchema}string" />
     *     &lt;/restriction>
     *   &lt;/complexContent>
     * &lt;/complexType>
     * </pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "")
    public static class Value {

        @XmlAttribute
        protected String id;
        @XmlAttribute
        protected String name;

        /**
         * Gets the value of the id property.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getId() {
            return id;
        }

        /**
         * Sets the value of the id property.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setId(String value) {
            this.id = value;
        }

        /**
         * Gets the value of the name property.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getName() {
            return name;
        }

        /**
         * Sets the value of the name property.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setName(String value) {
            this.name = value;
        }

    }

}
