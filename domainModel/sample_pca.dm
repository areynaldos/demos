<?xml version="1.0" encoding="UTF-8"?>
<domain-model name="sample_pca" type="Physical" version="1.0" xmlns="http://www.maketechnologies.com/tlm/domain-model" xmlns:ns="http://www.maketechnologies.com/tlm/domain-model/diagram">
	<meta-property name="diagrams">
		<ns:diagrams>
			<ns:diagram name="All Elements" showForeignKeyProperties="true">
				<ns:entity-node entity-id="User" x="270" y="48"/>
				<ns:entity-node entity-id="Role" x="487" y="48"/>
				<ns:entity-node entity-id="Addr" x="145" y="356"/>
				<ns:entity-node entity-id="Priv" x="372" y="356"/>
				<ns:entity-node entity-id="Locn" x="48" y="48"/>
				<ns:entity-node entity-id="UserEquip" x="691" y="48"/>
			</ns:diagram>
			<ns:diagram name="Base Types" showForeignKeyProperties="true">
				<ns:entity-node entity-id="longText" x="201" y="387"/>
				<ns:entity-node entity-id="string" x="156" y="96"/>
				<ns:entity-node entity-id="long" x="360" y="242"/>
				<ns:entity-node entity-id="decimal" x="360" y="336"/>
				<ns:entity-node entity-id="string30" x="205" y="294"/>
				<ns:entity-node entity-id="string60" x="201" y="341"/>
				<ns:entity-node entity-id="integer1" x="420" y="143"/>
				<ns:entity-node entity-id="long10" x="420" y="288"/>
				<ns:entity-node entity-id="decimal13.2" x="420" y="387"/>
				<ns:entity-node entity-id="string12" x="205" y="242"/>
				<ns:entity-node entity-id="integer6" x="420" y="195"/>
				<ns:entity-node entity-id="integer" x="360" y="96"/>
				<ns:entity-node entity-id="string1" x="205" y="143"/>
				<ns:entity-node entity-id="string2" x="206" y="195"/>
				<ns:entity-node entity-id="stringYNBoolean" x="195" y="440"/>
				<ns:entity-node entity-id="stringXBoolean" x="36" y="341"/>
			</ns:diagram>
		</ns:diagrams>
	</meta-property>
	<meta-property name="generation:com.maketechnologies.tlm.model.domain.gen.jpa.JpaGenerationSourceProvider">false</meta-property>
	<simpleType name="longText" restricts="string">
		<constraint type="maxLength" value="2147483647"/>
	</simpleType>
	<simpleType name="string30" restricts="string">
		<constraint type="maxLength" value="30"/>
	</simpleType>
	<simpleType name="string60" restricts="string">
		<constraint type="maxLength" value="60"/>
	</simpleType>
	<simpleType name="integer1" restricts="integer">
		<constraint type="totalDigits" value="1"/>
	</simpleType>
	<simpleType name="long10" restricts="long">
		<constraint type="totalDigits" value="10"/>
	</simpleType>
	<simpleType name="decimal13.2" restricts="decimal">
		<constraint type="totalDigits" value="13"/>
		<constraint type="fractionDigits" value="2"/>
	</simpleType>
	<simpleType name="string12" restricts="string">
		<constraint type="maxLength" value="12"/>
	</simpleType>
	<simpleType name="integer6" restricts="integer">
		<constraint type="totalDigits" value="6"/>
	</simpleType>
	<simpleType name="string1" restricts="string">
		<constraint type="maxLength" value="1"/>
	</simpleType>
	<simpleType name="string2" restricts="string">
		<constraint type="maxLength" value="2"/>
	</simpleType>
	<simpleType name="stringYNBoolean" restricts="string">
		<description>Boolean variant - Y / N flag values</description>
		<constraint type="maxLength" value="1"/>
		<constraint type="enumeration" value="Y"/>
		<constraint type="enumeration" value="N"/>
	</simpleType>
	<simpleType name="stringXBoolean" restricts="string1">
		<description>Boolean variant - blank (no) / X (is selected) flag values</description>
		<constraint type="enumeration" value=" ">
			<description>is not set</description>
		</constraint>
		<constraint type="enumeration" value="X">
			<description>is set</description>
		</constraint>
	</simpleType>
	<entity name="User">
		<property name="acctid" type="long10">
			<description>the primary key or identity</description>
		</property>
		<property name="acctnm" type="string12">
			<meta-property name="logical-name">User Name</meta-property>
			<description>System user account name for this person</description>
		</property>
		<property name="fname" type="string12">
			<meta-property name="logical-name">First Name</meta-property>
			<description>the first name of the person</description>
		</property>
		<property min-occurs="1" name="lname" type="string30">
			<meta-property name="logical-name">Last Name</meta-property>
			<description>the Last name / Surname / Family name of the person</description>
		</property>
		<property name="email" type="string60">
			<description>the primary email address of the person</description>
		</property>
		<property name="phone" type="long10">
			<description>the primary phone number of the person</description>
		</property>
		<property name="useEmail">
			<description>Should we use e-mail (E) or postal mail (M) to contact this person?</description>
			<simpleType restricts="string1">
				<constraint type="enumeration" value="M">
					<meta-property name="display-name">postal (M)ail</meta-property>
					<description>use postal mail</description>
				</constraint>
				<constraint type="enumeration" value="E">
					<meta-property name="display-name">(E)-mail</meta-property>
					<description>use e-mail</description>
				</constraint>
			</simpleType>
		</property>
		<property name="mgr" type="string12">
			<meta-property name="logical-name">Administrator User Name</meta-property>
			<description>System user account name of this persons manager.</description>
		</property>
		<property name="cmt" type="longText">
			<meta-property name="jpa-fetch-type">LAZY</meta-property>
			<meta-property name="logical-name">Comment</meta-property>
		</property>
		<primary-key name="Person_PK">
			<property-ref name="acctid"/>
		</primary-key>
		<unique-key name="Person_UK0">
			<property-ref name="acctnm"/>
		</unique-key>
	</entity>
	<entity name="Role">
		<description>Roles that a Person can perform in the system</description>
		<property min-occurs="1" name="cd" type="string12">
			<meta-property name="logical-name">Type</meta-property>
		</property>
		<property name="desc" type="string">
			<meta-property name="logical-name">Description</meta-property>
		</property>
		<property name="privct" type="integer6">
			<meta-property name="logical-name">Count of Persons</meta-property>
			<description>Count of the number of Persons with this Role at this time.</description>
		</property>
		<property name="adminRole" type="stringXBoolean">
			<description>Is this an admin-type role?</description>
		</property>
		<primary-key name="Role_PK">
			<property-ref name="cd"/>
		</primary-key>
	</entity>
	<entity name="Addr">
		<meta-property name="logical-name">address</meta-property>
		<property name="addrid" type="long10">
			<description>the primary key or identity</description>
		</property>
		<property name="type" type="string1">
			<description>Address type - (H)ome, (W)ork, (C)ontact</description>
		</property>
		<property name="line1" type="string60"/>
		<property name="line2" type="string60"/>
		<property name="city" type="string30"/>
		<property name="User_id" type="long10"/>
		<property name="Locn_provcd" type="string2"/>
		<primary-key name="Addr_PK">
			<property-ref name="addrid"/>
		</primary-key>
		<unique-key name="Addr_UK0">
			<property-ref name="User_id"/>
			<property-ref name="type"/>
		</unique-key>
		<foreign-key name="Addr_Person_FK0" referent="Person_PK">
			<property-ref name="User_id"/>
		</foreign-key>
		<foreign-key name="Addr_Locn_FK1" referent="Prov_PK">
			<property-ref name="Locn_provcd"/>
		</foreign-key>
	</entity>
	<entity name="Priv">
		<meta-property name="logical-name">Privilege</meta-property>
		<description>A Privilege is a Role assigned to a Person</description>
		<property name="prime" type="stringYNBoolean">
			<meta-property name="logical-name">Primary Role</meta-property>
			<description>Is this the primary Role (Y/N)?</description>
		</property>
		<property name="max" type="decimal13.2">
			<meta-property name="logical-name">Maximum Authorization</meta-property>
		</property>
		<property name="Role_cd" type="string12"/>
		<property name="Acct_id" type="long10"/>
		<property min-occurs="1" name="effdat" type="date"/>
		<property name="expdat" type="date"/>
		<primary-key name="Priv_PK">
			<property-ref name="Acct_id"/>
			<property-ref name="Role_cd"/>
		</primary-key>
		<foreign-key name="Priv_Role_FK0" referent="Role_PK">
			<property-ref name="Role_cd"/>
		</foreign-key>
		<foreign-key name="Priv_Person_FK1" referent="Person_PK">
			<property-ref name="Acct_id"/>
		</foreign-key>
	</entity>
	<entity name="Locn">
		<meta-property name="logical-name">location</meta-property>
		<property min-occurs="1" name="provcd" type="string2">
			<meta-property name="logical-name">province code</meta-property>
		</property>
		<property min-occurs="1" name="provnm" type="string30">
			<meta-property name="logical-name">province name</meta-property>
		</property>
		<property min-occurs="1" name="cntry" type="string30">
			<meta-property name="logical-name">country</meta-property>
		</property>
		<primary-key name="Prov_PK">
			<property-ref name="provcd"/>
		</primary-key>
		<unique-key name="Locn_UK0">
			<property-ref name="provnm"/>
		</unique-key>
	</entity>
	<entity name="UserEquip">
		<description>Equipment alloted to Users, physically sited (at their address) or non-sited (mobile)&#xd;
Equipment many have many pieces or accesories.  These have same Id, but User is not specified for them.</description>
		<property name="equipid" type="long10">
			<description>the primary key or identity</description>
		</property>
		<property name="User_id" type="long10"/>
		<property name="desc" type="string60"/>
		<property name="mfrsn" type="string30">
			<description>equipment manufacturer serial number</description>
		</property>
		<property name="mobile">
			<description>Is this equipment at the users site (S) or mobile (M)?</description>
			<simpleType restricts="string1">
				<constraint type="enumeration" value="S">
					<description>at users site</description>
				</constraint>
				<constraint type="enumeration" value="M">
					<description>mobile</description>
				</constraint>
			</simpleType>
		</property>
	</entity>
</domain-model>
