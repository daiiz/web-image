<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="web-screenshot">
    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
      <xsl:attribute name='width'>
        <xsl:value-of select="natural-width" />
      </xsl:attribute>
      <xsl:attribute name='height'>
        <xsl:value-of select="natural-height" />
      </xsl:attribute>
      <xsl:attribute name='viewBox'>
        <xsl:text>0</xsl:text>
        <xsl:text> </xsl:text>
        <xsl:text>0</xsl:text>
        <xsl:text> </xsl:text>
        <xsl:value-of select="natural-width" />
        <xsl:text> </xsl:text>
        <xsl:value-of select="natural-height" />
      </xsl:attribute>

      <defs>
        <style type="text/css">
          <![CDATA[
          .source text {
            fill: #888888;
            font-size: 11px;
            font-weight: 400;
            text-decoration: none;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
          }
          .source text:hover {
            text-decoration: underline;
            fill: #2962FF;
          }
          ]]>
        </style>
      </defs>

      <image xmlns:xlink="http://www.w3.org/1999/xlink">
        <xsl:attribute name='x'>
          <xsl:text>0</xsl:text>
        </xsl:attribute>
        <xsl:attribute name='y'>
          <xsl:text>0</xsl:text>
        </xsl:attribute>
        <xsl:attribute name='width'>
          <xsl:value-of select="natural-width" />
        </xsl:attribute>
        <xsl:attribute name='height'>
          <xsl:value-of select="natural-height" />
        </xsl:attribute>
        <xsl:attribute name='xlink:href'>
          <xsl:value-of select="background-image/@src" />
        </xsl:attribute>
      </image>

      <a xmlns:xlink="http://www.w3.org/1999/xlink" class="source" target="_blank" style="cursor: pointer;">
        <xsl:attribute name='xlink:href'>
          <xsl:value-of select="cite/@source" />
        </xsl:attribute>
        <text fill="transparent">
          <xsl:attribute name='x'>
            <xsl:value-of select="4" />
          </xsl:attribute>
          <xsl:attribute name='y'>
            <xsl:value-of select="natural-height - 4" />
          </xsl:attribute>
          <xsl:value-of select="cite" />
        </text>
      </a>

      <xsl:for-each select="external-images/image">
        <image xmlns:xlink="http://www.w3.org/1999/xlink">
          <xsl:attribute name='xlink:href'>
            <xsl:value-of select="@href" />
          </xsl:attribute>
          <xsl:attribute name='x'>
            <xsl:value-of select="@x" />
          </xsl:attribute>
          <xsl:attribute name='y'>
            <xsl:value-of select="@y" />
          </xsl:attribute>
          <xsl:attribute name='width'>
            <xsl:value-of select="@width" />
          </xsl:attribute>
          <xsl:attribute name='height'>
            <xsl:value-of select="@height" />
          </xsl:attribute>
        </image>
      </xsl:for-each>

      <xsl:for-each select="external-links/link">
        <a xmlns:xlink="http://www.w3.org/1999/xlink" target="_blank" style="cursor: pointer;">
          <xsl:attribute name='xlink:href'>
            <xsl:value-of select="@href" />
          </xsl:attribute>
          <rect fill="transparent">
            <xsl:attribute name='x'>
              <xsl:value-of select="@x" />
            </xsl:attribute>
            <xsl:attribute name='y'>
              <xsl:value-of select="@y" />
            </xsl:attribute>
            <xsl:attribute name='width'>
              <xsl:value-of select="@width" />
            </xsl:attribute>
            <xsl:attribute name='height'>
              <xsl:value-of select="@height" />
            </xsl:attribute>
          </rect>
          <text fill="transparent">
            <xsl:attribute name='x'>
              <xsl:value-of select="@x" />
            </xsl:attribute>
            <xsl:attribute name='y'>
              <xsl:value-of select="@y+@height" />
            </xsl:attribute>
            <xsl:value-of select="." />
          </text>
        </a>
      </xsl:for-each>
    </svg>
  </xsl:template>
</xsl:stylesheet>
