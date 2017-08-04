package com.hlzn.HRS.tool;

import org.hibernate.collection.spi.PersistentCollection;
import org.hibernate.proxy.HibernateProxy;
import org.hibernate.proxy.LazyInitializer;

import com.alibaba.fastjson.serializer.PropertyFilter;

public class SimplePropertyFilter implements PropertyFilter
{
	/**
	 * @param obj
	 *            需要过滤的对象
	 * @param s
	 *            属性
	 * @param obj1
	 *            属性在内存中的存值 过滤不需要被序列化的属性，主要用于hibernate的代理和管理。
	 *            obj1是属性的值，hibernate加载出来后可能是HibernateProxy或PersistentCollection
	 *            过滤它
	 */
	@Override
	public boolean apply(Object obj, String s, Object obj1) {
		if (obj1 instanceof HibernateProxy) {// hibernate代理对象
			LazyInitializer initializer = ((HibernateProxy) obj1)
					.getHibernateLazyInitializer();
			if (initializer.isUninitialized()) {
				return false;
			}
		} else if (obj1 instanceof PersistentCollection) {// 实体关联一对多
			PersistentCollection collection = (PersistentCollection) obj1;
			if (!collection.wasInitialized()) {
				return false;
			}
		}
		return true;
	}

}
