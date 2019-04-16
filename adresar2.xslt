<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:a="http://tempuri.org/XMLSchema.xsd"
    exclude-result-prefixes="xs"
    version="1.0">

  <xsl:template match="/" >
    <html>
      <head>
        <title>Transformacija 1</title>
        <style>
          table {
          font-family: arial, sans-serif;
          border-collapse: collapse;
          width: 100%;
          }

          td, th {
          border: 1px solid #dddddd;
          text-align: left;
          padding: 8px;
          }

          tr:nth-child(even) {
          background-color: #dddddd;
          }
        </style>
      </head>
      <body>

        <h2>Osobe i kompanije</h2>

        <table>
          <tr>
            <th>Puno ime</th>
            <th>Datum rodjenja</th>
            <th>Naziv</th>
            <th>Adresa</th>
            <th>Telefon</th>
            <th>E-mail</th>
          </tr>
          <xsl:apply-templates />
        </table>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="a:adresar">

    <xsl:for-each select="a:osoba">
      <xsl:if test="a:adresa/@tip='stalna' and a:datumRodjenja/a:godina &gt; 1989 and a:datumRodjenja/a:godina &lt; 2006 and starts-with(a:punoIme/a:prezime,'M')">
        <tr>
          <td>
            <xsl:value-of select="a:punoIme/a:ime"/>
            <xsl:text> </xsl:text>
            <xsl:if test="count(a:punoIme/a:srednjeIme) &gt; 0">
              <xsl:value-of select="a:punoIme/a:srednjeIme"/>
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:for-each select="a:punoIme/a:prezime">
              <xsl:value-of select="."/>
              <xsl:text> </xsl:text>
            </xsl:for-each>
          </td>
          <td>
            <xsl:value-of select="a:datumRodjenja/a:dan"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="a:datumRodjenja/a:mesec"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="a:datumRodjenja/a:godina"/>
          </td>
          <td>/</td>
          <td>
            <xsl:value-of select="a:adresa/a:ulica"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="a:adresa/a:broj"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="a:adresa/a:grad"/>
            <xsl:if test="count(a:adresa/a:drzava) &gt; 0">
              <xsl:text> </xsl:text>
              <xsl:value-of select="a:adresa/a:drzava"/>
            </xsl:if>
          </td>
          <td>
            <xsl:value-of select="a:telefon"/>
          </td>
          <td>
            <xsl:for-each select="a:email">
              <xsl:value-of select="."/>
              <xsl:text> </xsl:text>
            </xsl:for-each>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="a:kompanija">
      <xsl:if test="string-length(a:naziv) &gt; 6 and a:adresa/@tip='stalna'">
        <tr>
          <td>/</td>
          <td>/</td>
          <td>
            <xsl:value-of select="a:naziv"/>
            <xsl:text> </xsl:text>
          </td>
          <td>
            <xsl:value-of select="a:adresa/a:ulica"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="a:adresa/a:broj"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="a:adresa/a:grad"/>
            <xsl:if test="count(a:adresa/a:drzava) &gt; 0">
              <xsl:text> </xsl:text>
              <xsl:value-of select="a:adresa/a:drzava"/>
            </xsl:if>
          </td>
          <td>
            <xsl:value-of select="a:telefon"/>
          </td>
          <td>
            <xsl:for-each select="a:email">
              <xsl:value-of select="."/>
              <xsl:text> </xsl:text>
            </xsl:for-each>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
