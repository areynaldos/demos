<?xml version="1.0" encoding="UTF-8"?>
<domain-model name="school" type="Logical" version="1.0" xmlns="http://www.maketechnologies.com/tlm/domain-model" xmlns:ns="http://www.maketechnologies.com/tlm/domain-model/diagram">
	<meta-property name="diagrams">
		<ns:diagrams>
			<ns:diagram name="Diagram">
				<ns:entity-node entity-id="BaseEntity" x="48" y="48"/>
				<ns:entity-node entity-id="Person" x="678" y="48"/>
				<ns:entity-node entity-id="RoleType" x="1100" y="48"/>
				<ns:entity-node entity-id="LongText" x="901" y="180"/>
				<ns:entity-node entity-id="Class" x="217" y="48"/>
				<ns:entity-node entity-id="ClassEnrolment" x="459" y="48"/>
				<ns:entity-node entity-id="Subject" x="901" y="48"/>
			</ns:diagram>
			<ns:diagram name="New Diagram" showIcons="true">
				<ns:entity-node entity-id="Person" x="434" y="324"/>
				<ns:entity-node entity-id="BaseEntity" showConstraints="false" showForeignKeyProperties="false" showProperties="true" showTransientProperties="false" x="432" y="72"/>
			</ns:diagram>
			<ns:diagram name="Base Entities">
				<ns:entity-node entity-id="BaseEntity" x="937" y="48"/>
				<ns:entity-node entity-id="string" x="406" y="48"/>
				<ns:entity-node entity-id="FinalGradeEnum" x="499" y="167"/>
				<ns:entity-node entity-id="HoursPerDayType" x="937" y="256"/>
				<ns:entity-node entity-id="RoleType" x="721" y="167"/>
			</ns:diagram>
			<ns:diagram name="School">
				<ns:entity-node entity-id="Class" x="420" y="144"/>
				<ns:entity-node entity-id="ClassEnrolment" x="696" y="144"/>
				<ns:entity-node entity-id="FinalGradeEnum" x="696" y="403"/>
				<ns:entity-node entity-id="HoursPerDayType" x="1008" y="403"/>
				<ns:entity-node entity-id="Person" x="944" y="150"/>
				<ns:entity-node entity-id="Subject" x="252" y="144"/>
				<ns:entity-node entity-id="ClassScheduleEnum" x="840" y="403"/>
			</ns:diagram>
		</ns:diagrams>
	</meta-property>
	<simpleType name="RoleType" restricts="string">
		<description>Types of roles in the system.</description>
		<constraint type="enumeration" value="Administrator">
			<description>the administrator role</description>
		</constraint>
		<constraint type="enumeration" value="User">
			<description>the user role</description>
		</constraint>
	</simpleType>
	<simpleType name="LongText" restricts="string">
		<constraint type="maxLength" value="2147483647"/>
	</simpleType>
	<simpleType name="FinalGradeEnum" restricts="string">
		<constraint type="maxLength" value="1"/>
		<constraint type="enumeration" value="A"/>
		<constraint type="enumeration" value="B"/>
		<constraint type="enumeration" value="C"/>
		<constraint type="enumeration" value="D"/>
		<constraint type="enumeration" value="E"/>
		<constraint type="enumeration" value="F"/>
	</simpleType>
	<simpleType name="ClassScheduleEnum" restricts="string">
		<constraint type="maxLength" value="3"/>
		<constraint type="enumeration" value="MWF">
			<meta-property name="display-name">Monday, Wednesday, Friday</meta-property>
		</constraint>
		<constraint type="enumeration" value="TT">
			<meta-property name="display-name">Tuesday, Thursday</meta-property>
		</constraint>
	</simpleType>
	<simpleType name="HoursPerDayType" restricts="int">
		<constraint type="minInclusive" value="1"/>
		<constraint type="maxInclusive" value="10"/>
	</simpleType>
	<entity name="BaseEntity">
		<property name="id" type="long">
			<description>the primary key or identity</description>
		</property>
		<property name="version" type="integer">
			<meta-property name="jpa-version">true</meta-property>
			<description>the version attribute, used for optimistic locking</description>
		</property>
		<property name="created" type="dateTime">
			<meta-property name="value-generation-pattern">CREATED_TIMESTAMP</meta-property>
			<description>the date/time at which this record was created</description>
		</property>
		<property name="modified" type="dateTime">
			<meta-property name="value-generation-pattern">UPDATED_TIMESTAMP</meta-property>
			<description>the date/time at which this record was last modified</description>
		</property>
		<property name="creator" type="string">
			<meta-property name="value-generation-pattern">CREATED_USER</meta-property>
			<description>the username of the person who created this record</description>
		</property>
		<property name="modifier" type="string">
			<meta-property name="value-generation-pattern">UPDATED_USER</meta-property>
			<description>the username of the person who last modified this record</description>
		</property>
		<primary-key name="BaseEntity_PK">
			<property-ref name="id"/>
		</primary-key>
	</entity>
	<entity name="Class">
		<property name="classId" type="string"/>
		<property name="subjectCode" type="string"/>
		<property name="teacherId" type="string"/>
		<property name="schedule" type="ClassScheduleEnum"/>
		<property name="hoursPerDay" type="HoursPerDayType"/>
		<primary-key name="Class_PK">
			<property-ref name="classId"/>
		</primary-key>
	</entity>
	<entity name="ClassEnrolment">
		<property name="classId" type="string"/>
		<property name="studentId" type="string"/>
		<property name="finalGrade" type="FinalGradeEnum"/>
	</entity>
	<entity name="Person">
		<meta-property name="table-name">VMRPERS</meta-property>
		<property name="personId" type="string"/>
		<property name="firstName" type="string"/>
		<property name="lastName" type="string"/>
		<property name="telephoneNumber" type="string"/>
		<property name="personType" type="string"/>
		<primary-key name="SchoolPerson_PK">
			<property-ref name="personId"/>
		</primary-key>
		<index name="Teacher_IX02">
			<property-ref name="lastName"/>
			<property-ref name="firstName"/>
		</index>
	</entity>
	<entity name="Subject">
		<meta-property name="table-name">VMRSUB</meta-property>
		<property name="code" type="string"/>
		<property name="description" type="string"/>
		<property name="alternateCode" type="string"/>
		<primary-key name="Subject_PK">
			<property-ref name="code"/>
		</primary-key>
		<unique-key name="Subject_UK0">
			<property-ref name="alternateCode"/>
		</unique-key>
	</entity>
</domain-model>
