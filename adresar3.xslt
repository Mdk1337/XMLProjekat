<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:a="http://tempuri.org/XMLSchema.xsd"
    exclude-result-prefixes="xs"
    version="1.0">

  <xsl:template match="/">
    <adresar xmlns="http://tempuri.org/XMLSchema.xsd"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="adresar.xsd">

      <xsl:apply-templates/>

    </adresar>
  </xsl:template>

  <xsl:template match="a:osoba">
    <xsl:element name="osoba">
      <xsl:attribute name="id">
        <xsl:value-of select="./@id"/>
      </xsl:attribute>
    </xsl:element>

    <xsl:element name="punoIme">
      <xsl:element name="ime">
        <xsl:value-of select="a:punoIme/a:ime"/>
      </xsl:element>

      <xsl:if test="count(a:punoIme/a:srednjeIme) &gt; 0">
        <xsl:element name="srednjeIme">
          <xsl:value-of select="a:punoIme/a:srednjeIme"/>
        </xsl:element>
      </xsl:if>

      <xsl:for-each select="a:punoIme/a:prezime">
        <xsl:element name="prezime">
          <xsl:value-of select="."/>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>

    <xsl:element name="datumRodjenja">
      <xsl:element name="dan">
        <xsl:value-of select="a:datumRodjenja/a:dan"/>
      </xsl:element>

      <xsl:element name="mesec">
        <xsl:value-of select="a:datumRodjenja/a:mesec"/>
      </xsl:element>

      <xsl:element name="godina">
        <xsl:value-of select="a:datumRodjenja/a:godina"/>
      </xsl:element>

    </xsl:element>

    <xsl:element name="adresa">
      <xsl:attribute name="tip">
        <xsl:value-of select="a:adresa/@tip"/>
      </xsl:attribute>

      <xsl:attribute name="ulica">
        <xsl:value-of select="a:adresa/a:ulica"/>
      </xsl:attribute>

      <xsl:attribute name="broj">
        <xsl:value-of select="a:adresa/a:broj"/>
      </xsl:attribute>

      <xsl:attribute name="grad">
        <xsl:value-of select="a:adresa/a:grad"/>
      </xsl:attribute>

      <xsl:if test="count(a:adresa/a:drzava) &gt; 0">
        <xsl:attribute name="drzava">
          <xsl:value-of select="a:adresa/a:drzava"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:element>

    <xsl:element name="telefon">
      <xsl:attribute name="broj">
        <xsl:value-of select="a:telefon/@broj"/>
      </xsl:attribute>
      <xsl:value-of select="a:telefon"/>
    </xsl:element>

    <xsl:for-each select="a:email">
      <xsl:element name="email">
        <xsl:attribute name="tip">
          <xsl:value-of select="./@tip"/>
        </xsl:attribute>
        <xsl:value-of select="."/>
      </xsl:element>
    </xsl:for-each>

  </xsl:template>

  <xsl:template match="a:kompanija">
    <xsl:element name="kompanija">
      <xsl:attribute name="id">
        <xsl:value-of select="./@id"/>
      </xsl:attribute>
    </xsl:element>
    <xsl:element name="naziv">
      <xsl:value-of select="a:naziv"/>
    </xsl:element>

    <xsl:element name="adresa">
      <xsl:attribute name="tip">
        <xsl:value-of select="a:adresa/@tip"/>
      </xsl:attribute>

      <xsl:attribute name="ulica">
        <xsl:value-of select="a:adresa/a:ulica"/>
      </xsl:attribute>

      <xsl:attribute name="broj">
        <xsl:value-of select="a:adresa/a:broj"/>
      </xsl:attribute>

      <xsl:attribute name="grad">
        <xsl:value-of select="a:adresa/a:grad"/>
      </xsl:attribute>

      <xsl:if test="count(a:adresa/a:drzava) &gt; 0">
        <xsl:attribute name="drzava">
          <xsl:value-of select="a:adresa/a:drzava"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:element>

    <xsl:element name="telefon">
      <xsl:attribute name="broj">
        <xsl:value-of select="a:telefon/@broj"/>
      </xsl:attribute>
      <xsl:value-of select="a:telefon"/>
    </xsl:element>

    <xsl:for-each select="a:email">
      <xsl:element name="email">
        <xsl:attribute name="tip">
          <xsl:value-of select="./@tip"/>
        </xsl:attribute>
        <xsl:value-of select="."/>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
