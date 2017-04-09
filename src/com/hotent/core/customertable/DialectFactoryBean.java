package com.hotent.core.customertable;

import org.springframework.beans.factory.FactoryBean;

import com.hotent.core.mybatis.Dialect;
import com.hotent.core.mybatis.dialect.DB2Dialect;
import com.hotent.core.mybatis.dialect.DmDialect;
import com.hotent.core.mybatis.dialect.H2Dialect;
import com.hotent.core.mybatis.dialect.MySQLDialect;
import com.hotent.core.mybatis.dialect.OracleDialect;
import com.hotent.core.mybatis.dialect.SQLServer2005Dialect;

/**
 * 方言FactoryBean，通过统一的接口取得不同数据库的分页Sql语句。
 * <pre>
 * 在app-beans.xml中的配置。
 * 
 * &lt;bean id="dialect" class="com.hotent.core.customertable.DialectFactoryBean">
 *			&lt;property name="dbType" value="${jdbc.dbType}"/>
 * &lt;/bean>
 * </pre>
 * @author ray
 *
 */
public class DialectFactoryBean implements FactoryBean<Dialect> {
	
	
	
	private Dialect dialect;
	
	/**
	 * 设置数据库类型
	 * @param dbType
	 */
	public void setDbType(String dbType)
	{
		 this.dbType=dbType;
	}
	
	private String dbType=SqlTypeConst. MYSQL;

	@Override
	public Dialect getObject() throws Exception {
		if(dbType.equals(SqlTypeConst.ORACLE)){
			dialect = new OracleDialect();
		}
		else if(dbType.equals(SqlTypeConst.SQLSERVER)){
			dialect = new SQLServer2005Dialect();
		}
		else if(dbType.equals(SqlTypeConst.DB2)){
			dialect = new DB2Dialect();
		}
		else if(dbType.equals(SqlTypeConst.MYSQL)){
			dialect = new MySQLDialect();
		}
		else if(dbType.equals(SqlTypeConst.H2)){
			dialect = new H2Dialect();
		}
		else if(dbType.equals(SqlTypeConst.DM)){
			dialect = new DmDialect();
		}
		else{
			throw new Exception("没有设置合适的数据库类型");
		}
		return dialect;
	}

	@Override
	public Class<?> getObjectType() {
		return Dialect.class;
	}

	@Override
	public boolean isSingleton() {
		return true;
	}

}
