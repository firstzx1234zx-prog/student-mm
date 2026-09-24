<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
    <title>ประวัตินักศึกษา</title>
    <style>
        body {
            font-family: 'Sarabun', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .profile-header {
            display: flex;
            align-items: center;
            border-bottom: 2px solid #007bff;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007bff;
            margin-right: 25px;
        }
        .info h1 {
            margin: 0 0 10px 0;
            color: #007bff;
        }
        .info p {
            margin: 5px 0;
            font-size: 16px;
        }
        .badge {
            background-color: #ffc107;
            padding: 4px 8px;
            border-radius: 5px;
            font-weight: bold;
        }
        h2 {
            color: #444;
            margin-top: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- ส่วนหัว ข้อมูลนักศึกษา -->
        <div class="profile-header">
            <img class="profile-pic" src="{student/profile/profile_picture}" alt="Profile Picture"/>
            <div class="info">
                <h1><xsl:value-of select="student/profile/first_name"/> <xsl:text> </xsl:text> <xsl:value-of select="student/profile/last_name"/></h1>
                <p><strong>รหัสนักศึกษา:</strong> <xsl:value-of select="student/profile/student_id"/></p>
                <p><strong>คณะ:</strong> <xsl:value-of select="student/profile/faculty"/></p>
                <p><strong>ชั้นปีที่:</strong> <xsl:value-of select="student/profile/year"/> <span style="margin-left: 15px;"><strong>เกรดเฉลี่ย (GPA):</strong> <span class="badge"><xsl:value-of select="student/profile/gpa"/></span></span></p>
            </div>
        </div>

        <!-- ส่วนตารางเรียน -->
        <h2>ตารางเรียน <xsl:value-of select="student/registration/semester"/> ปีการศึกษา <xsl:value-of select="student/registration/academic_year"/></h2>
        <table>
            <tr>
                <th>วัน</th>
                <th>เวลา</th>
                <th>รหัสวิชา</th>
                <th>ห้องเรียน</th>
                <th>อาคาร</th>
            </tr>
            <xsl:for-each select="student/registration/courses/course">
            <tr>
                <td><strong><xsl:value-of select="day"/></strong></td>
                <td><xsl:value-of select="time"/></td>
                <td><xsl:value-of select="course_code"/></td>
                <td><xsl:value-of select="room"/></td>
                <td><xsl:value-of select="building"/></td>
            </tr>
            </xsl:for-each>
        </table>
    </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
