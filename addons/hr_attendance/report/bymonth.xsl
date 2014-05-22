<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/">
        <xsl:call-template name="rml" />
    </xsl:template>


    <xsl:template name="rml">
		<document filename="example.pdf">
			<template pageSize="29.7cm,21cm" leftMargin="2.0cm" rightMargin="2.0cm" topMargin="2.0cm" bottomMargin="2.0cm" title="Timesheets" author="Generated by Open ERP, Fabien Pinckaers" allowSplitting="20">
				<pageTemplate id="first">
					<pageGraphics>
						<drawRightString x="19.0cm" y="26.0cm"><xsl:value-of select="date"/></drawRightString>
					</pageGraphics>
					<frame id="col1" x1="2.0cm" y1="2.5cm" width="22.7cm" height="18cm"/>
				</pageTemplate>
			</template>
			
			<stylesheet>
				<paraStyle name="name" fontName="Helvetica" textColor="green" fontSize="7"/>
				<paraStyle name="normal" fontName="Helvetica" fontSize="6"/>
				<blockTableStyle id="week">
					<blockFont name="Helvetica-BoldOblique" size="8" start="0,0" stop="-1,0"/>
					<blockFont name="Helvetica" size="5" start="0,1" stop="-1,-1"/>
					<blockBackground colorName="grey" start="0,0" stop="-1,0"/>
					<lineStyle kind="LINEABOVE" colorName="grey" start="0,0" stop="-1,0" />
					<lineStyle kind="LINEBEFORE" colorName="grey" start="0,0" stop="-1,-1"/>
					<lineStyle kind="LINEAFTER" colorName="grey" start="-1,0" stop="-1,-1"/>
					<blockValign value="TOP"/>
				</blockTableStyle>
			</stylesheet>

			<story>
				<xsl:call-template name="story"/>
			</story>
		</document>
    </xsl:template>

    <xsl:template name="story">
        <blockTable
			colWidths="2cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm,0.79cm" style="week">
            <tr>
				<td><xsl:value-of select="/report/month" /><xsl:text> </xsl:text><xsl:value-of select="/report/year" /></td>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>7</td>
				<td>8</td>
				<td>9</td>
				<td>10</td>
				<td>11</td>
				<td>12</td>
				<td>13</td>
				<td>14</td>
				<td>15</td>
				<td>16</td>
				<td>17</td>
				<td>18</td>
				<td>19</td>
				<td>20</td>
				<td>21</td>
				<td>22</td>
				<td>23</td>
				<td>24</td>
				<td>25</td>
				<td>26</td>
				<td>27</td>
				<td>28</td>
				<td>29</td>
				<td>30</td>
				<td>31</td>
            </tr>
			<xsl:apply-templates select="report/user"/>
        </blockTable>
    </xsl:template>

    <xsl:template match="user">
		<tr></tr>
		<tr>
			<td>
				<para style="name"><xsl:value-of select="name" /></para>
			</td>
		</tr>
		<tr>
			<td>Worked</td>
			<xsl:for-each select="day">
				<td><xsl:value-of select="wh" /></td>
			</xsl:for-each>
		</tr>
    </xsl:template>
</xsl:stylesheet>