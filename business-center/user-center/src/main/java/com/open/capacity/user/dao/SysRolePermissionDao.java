package com.open.capacity.user.dao;

import java.util.Set;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.open.capacity.common.model.SysPermission;

 
/**
* @author 作者 owen 
* @version 创建时间：2017年11月12日 上午22:57:51
 * 角色权限关系
 */
@Mapper
public interface SysRolePermissionDao {

	@Insert("insert into sys_role_permission(role_id, permission_id) values(#{roleId}, #{permissionId})")
	int saveRolePermission(@Param("roleId") Long roleId, @Param("permissionId") Long permissionId);

	int deleteRolePermission(@Param("roleId") Long roleId, @Param("permissionId") Long permissionId);

	Set<SysPermission> findPermissionsByRoleIds(@Param("roleIds") Set<Long> roleIds);

}
