<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>
<xsl:template match="/student">
<html lang="th">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>ข้อมูลนักศึกษา</title>
  <style>
    * { box-sizing: border-box; }
    body { margin: 0; font-family: Arial, "Noto Sans Thai", sans-serif; background: #f3f4f6; color: #1f2937; }
    .container { max-width: 700px; margin: 24px auto; padding: 16px; }
    .header { background: linear-gradient(135deg, #2563eb, #7c3aed); color: white; border-radius: 18px; padding: 22px 18px; box-shadow: 0 8px 18px rgba(0,0,0,.12); }
    .header h1 { margin: 0; font-size: 26px; }
    .header p { margin: 8px 0 0 0; opacity: 0.9; }
    .card { background: white; border-radius: 16px; margin-top: 18px; padding: 18px; box-shadow: 0 4px 12px rgba(0,0,0,.08); }
    .card h2 { margin-top: 0; color: #2563eb; font-size: 20px; border-bottom: 1px solid #e5e7eb; padding-bottom: 10px; }
    .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
    .item { background: #f8fafc; padding: 12px; border-radius: 10px; }
    .label { display: block; font-size: 12px; color: #64748b; margin-bottom: 4px; }
    .value { font-weight: 700; font-size: 16px; }
    .gpa { color: #16a34a; }
    table { width: 100%; border-collapse: collapse; margin-top: 10px; }
    th, td { text-align: left; padding: 12px 8px; border-bottom: 1px solid #e5e7eb; font-size: 14px; }
    th { background: #2563eb; color: white; }
    .total { margin-top: 14px; text-align: right; font-weight: 700; color: #166534; background: #dcfce7; padding: 12px; border-radius: 10px; }
    @media (max-width: 500px) { .grid { grid-template-columns: 1fr; } .container { padding: 12px; } }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <h1>ข้อมูลนักศึกษา</h1>
      <p><xsl:value-of select="registration/semester"/> ปีการศึกษา <xsl:value-of select="registration/academicYear"/></p>
    </div>

    <div class="card">
      <h2>ข้อมูลส่วนตัว</h2>
      <div class="grid">
        <div class="item"><span class="label">รหัสนักศึกษา</span><span class="value"><xsl:value-of select="studentId"/></span></div>
        <div class="item"><span class="label">ชื่อ-นามสกุล</span><span class="value"><xsl:value-of select="firstName"/><xsl:text> </xsl:text><xsl:value-of select="lastName"/></span></div>
        <div class="item"><span class="label">คณะ</span><span class="value"><xsl:value-of select="faculty"/></span></div>
        <div class="item"><span class="label">สาขา</span><span class="value"><xsl:value-of select="major"/></span></div>
        <div class="item"><span class="label">ชั้นปี</span><span class="value">ปีที่ <xsl:value-of select="year"/></span></div>
        <div class="item"><span class="label">GPA</span><span class="value gpa"><xsl:value-of select="format-number(gpa,'0.00')"/></span></div>
      </div>
    </div>

    <div class="card">
      <h2>รายวิชาที่ลงทะเบียน</h2>
      <table>
        <thead><tr><th>ลำดับ</th><th>รหัสวิชา</th><th>ชื่อวิชา</th><th>หน่วยกิต</th></tr></thead>
        <tbody>
          <xsl:for-each select="registration/courses/course">
            <tr>
              <td><xsl:value-of select="position()"/></td>
              <td><xsl:value-of select="code"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="credits"/></td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
      <div class="total">รวมหน่วยกิตทั้งหมด: <xsl:value-of select="sum(registration/courses/course/credits)"/> หน่วยกิต</div>
    </div>
  </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
