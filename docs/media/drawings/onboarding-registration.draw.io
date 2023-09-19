<mxfile host="app.diagrams.net" modified="2023-09-19T14:28:34.051Z" agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/117.0" etag="3SZXpKtQbPAwmtp5UQqc" version="21.7.5" type="github">
  <diagram name="Seite-1" id="xKnN4ZHrS10Ob_aHEZOJ">
    <mxGraphModel dx="1242" dy="821" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="yTCr8bQdOqjygj6dUeAG-14" value="IDP" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" parent="1" vertex="1">
          <mxGeometry x="120" y="300" width="710" height="240" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-16" value="Shared IDP" style="swimlane;html=1;startSize=20;horizontal=0;" parent="yTCr8bQdOqjygj6dUeAG-14" vertex="1">
          <mxGeometry x="20" width="690" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-24" value="Creates Keycloak Realm and User" style="whiteSpace=wrap;html=1;verticalAlign=top;rounded=1;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-16" vertex="1">
          <mxGeometry x="125" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-36" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-16" source="yTCr8bQdOqjygj6dUeAG-28" target="yTCr8bQdOqjygj6dUeAG-35" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-28" value="Assign Company-Admin Role" style="whiteSpace=wrap;html=1;verticalAlign=top;rounded=1;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-16" vertex="1">
          <mxGeometry x="310" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-35" value="Send One Time Password and Credentials to User" style="whiteSpace=wrap;html=1;verticalAlign=top;rounded=1;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-16" vertex="1">
          <mxGeometry x="510" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-15" value="Central IDP" style="swimlane;html=1;startSize=20;horizontal=0;" parent="yTCr8bQdOqjygj6dUeAG-14" vertex="1">
          <mxGeometry x="20" y="120" width="690" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-26" value="Creates Identity for SSO Providers and shared User" style="whiteSpace=wrap;html=1;verticalAlign=top;rounded=1;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-15" vertex="1">
          <mxGeometry x="125" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-27" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-14" source="yTCr8bQdOqjygj6dUeAG-24" target="yTCr8bQdOqjygj6dUeAG-26" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-29" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-14" source="yTCr8bQdOqjygj6dUeAG-26" target="yTCr8bQdOqjygj6dUeAG-28" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-19" value="User" style="swimlane;html=1;startSize=20;fontStyle=1;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;" parent="1" vertex="1">
          <mxGeometry x="120" y="100" width="710" height="130" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-23" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-19" source="yTCr8bQdOqjygj6dUeAG-20" target="yTCr8bQdOqjygj6dUeAG-22" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-20" value="Recieves Invite" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=standard;symbol=message;" parent="yTCr8bQdOqjygj6dUeAG-19" vertex="1">
          <mxGeometry x="50" y="35" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-22" value="Clicks On Link to Portal" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-19" vertex="1">
          <mxGeometry x="145" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-37" value="One Time Password" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=end;symbol=message;" parent="yTCr8bQdOqjygj6dUeAG-19" vertex="1">
          <mxGeometry x="565" y="35" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-25" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;dashed=1;" parent="1" source="yTCr8bQdOqjygj6dUeAG-22" target="yTCr8bQdOqjygj6dUeAG-24" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-39" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=1;entryDx=0;entryDy=0;entryPerimeter=0;" parent="1" source="yTCr8bQdOqjygj6dUeAG-35" target="yTCr8bQdOqjygj6dUeAG-37" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="710" y="220" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-40" value="Initial IDP Registration" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;" parent="1" vertex="1">
          <mxGeometry x="120" y="40" width="140" height="30" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-41" value="Portal Registration" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;" parent="1" vertex="1">
          <mxGeometry x="130" y="600" width="120" height="30" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-42" value="User" style="swimlane;html=1;startSize=20;fontStyle=1;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;" parent="1" vertex="1">
          <mxGeometry x="120" y="632" width="1970" height="128" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-43" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-42" source="yTCr8bQdOqjygj6dUeAG-44" target="yTCr8bQdOqjygj6dUeAG-45" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-44" value="One Time Password" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=standard;symbol=message;" parent="yTCr8bQdOqjygj6dUeAG-42" vertex="1">
          <mxGeometry x="50" y="30" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-48" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-42" source="yTCr8bQdOqjygj6dUeAG-45" target="yTCr8bQdOqjygj6dUeAG-47" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-45" value="Navigate to Portal" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-42" vertex="1">
          <mxGeometry x="150" y="25" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-47" value="Search for Company by Name and Login with Credentials" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-42" vertex="1">
          <mxGeometry x="345" y="25" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-50" value="Cofinity-X Services" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" parent="1" vertex="1">
          <mxGeometry x="120" y="800" width="1970" height="370" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-51" value="Portal" style="swimlane;html=1;startSize=20;horizontal=0;" parent="yTCr8bQdOqjygj6dUeAG-50" vertex="1">
          <mxGeometry x="20" width="1950" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-86" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-79" target="yTCr8bQdOqjygj6dUeAG-85" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-79" value="" style="points=[[0.25,0.25,0],[0.5,0,0],[0.75,0.25,0],[1,0.5,0],[0.75,0.75,0],[0.5,1,0],[0.25,0.75,0],[0,0.5,0]];shape=mxgraph.bpmn.gateway2;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=rhombusPerimeter;outlineConnect=0;outline=none;symbol=none;gwType=parallel;" parent="yTCr8bQdOqjygj6dUeAG-51" vertex="1">
          <mxGeometry x="360" y="40" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-88" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-85" target="yTCr8bQdOqjygj6dUeAG-87" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-85" value="Insert Company Details" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-51" vertex="1">
          <mxGeometry x="450" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-90" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-87" target="yTCr8bQdOqjygj6dUeAG-89" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-87" value="Invite other Users" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-51" vertex="1">
          <mxGeometry x="650" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-92" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-89" target="yTCr8bQdOqjygj6dUeAG-91" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-89" value="Select Routes?&lt;br&gt;&lt;font color=&quot;#ff3333&quot;&gt;(what does this do?)&lt;/font&gt;" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-51" vertex="1">
          <mxGeometry x="850" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-95" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-91" target="yTCr8bQdOqjygj6dUeAG-94" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-91" value="Upload Handelsregister Auszug" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-51" vertex="1">
          <mxGeometry x="1050" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-102" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-94" target="64A1k_Dh1uGcnGidKPN--1" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1464" y="65" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-94" value="User Confirms" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-51" vertex="1">
          <mxGeometry x="1250" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-142" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" parent="yTCr8bQdOqjygj6dUeAG-51" source="64A1k_Dh1uGcnGidKPN--1" target="yTCr8bQdOqjygj6dUeAG-141" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1514" y="65" as="sourcePoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-141" value="Send Mail to Cofinity-X Admin" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=throwing;symbol=message;" parent="yTCr8bQdOqjygj6dUeAG-51" vertex="1">
          <mxGeometry x="1810" y="40" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--1" value="Request DID" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-51" vertex="1">
          <mxGeometry x="1420" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-84" value="BPN Discovery" style="swimlane;html=1;startSize=20;fontStyle=1;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;" parent="yTCr8bQdOqjygj6dUeAG-50" vertex="1">
          <mxGeometry x="20" y="120" width="1950" height="130" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-123" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-84" source="yTCr8bQdOqjygj6dUeAG-71" target="yTCr8bQdOqjygj6dUeAG-122" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-71" value="Lookup BPNL&amp;nbsp;" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-84" vertex="1">
          <mxGeometry x="445" y="39" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-122" value="" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=end;symbol=terminate2;" parent="yTCr8bQdOqjygj6dUeAG-84" vertex="1">
          <mxGeometry x="620" y="44" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-75" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;exitPerimeter=0;" parent="yTCr8bQdOqjygj6dUeAG-50" source="yTCr8bQdOqjygj6dUeAG-79" target="yTCr8bQdOqjygj6dUeAG-71" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="435" y="-60" as="sourcePoint" />
            <mxPoint x="435" y="160" as="targetPoint" />
            <Array as="points">
              <mxPoint x="405" y="189" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-98" value="MIW" style="swimlane;html=1;startSize=20;fontStyle=1;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;" parent="yTCr8bQdOqjygj6dUeAG-50" vertex="1">
          <mxGeometry x="20" y="250" width="1950" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-96" value="MIW Generates Wallet for BPN" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-98" vertex="1">
          <mxGeometry x="1044" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--3" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" parent="yTCr8bQdOqjygj6dUeAG-98" source="yTCr8bQdOqjygj6dUeAG-96" target="64A1k_Dh1uGcnGidKPN--2" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1363.9999999999995" y="60" as="sourcePoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--5" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-98" source="64A1k_Dh1uGcnGidKPN--2" target="64A1k_Dh1uGcnGidKPN--4" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--2" value="&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;&quot;&gt;Register Revocation List for DID&lt;br&gt;&lt;/span&gt;&lt;font color=&quot;#ff3333&quot;&gt;&lt;span style=&quot;font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: center; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;&quot;&gt;(there is no revocation list for DID to be clarified)&lt;/span&gt;&lt;span style=&quot;font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: center; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/font&gt;" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-98" vertex="1">
          <mxGeometry x="1220" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--7" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-98" source="64A1k_Dh1uGcnGidKPN--4" target="64A1k_Dh1uGcnGidKPN--6" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--4" value="&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;&quot;&gt;Create Membership + BPN Credential + DID-Document&lt;/span&gt;" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-98" vertex="1">
          <mxGeometry x="1380" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--6" value="&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;&quot;&gt;Response with DID&lt;/span&gt;" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-98" vertex="1">
          <mxGeometry x="1580" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-97" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" parent="yTCr8bQdOqjygj6dUeAG-50" source="64A1k_Dh1uGcnGidKPN--1" target="yTCr8bQdOqjygj6dUeAG-96" edge="1">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1500" y="200" />
              <mxPoint x="1120" y="200" />
            </Array>
            <mxPoint x="1509" y="90" as="sourcePoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--9" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.75;entryY=1;entryDx=0;entryDy=0;" parent="yTCr8bQdOqjygj6dUeAG-50" source="64A1k_Dh1uGcnGidKPN--6" target="64A1k_Dh1uGcnGidKPN--1" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1660" y="170" as="targetPoint" />
            <Array as="points">
              <mxPoint x="1670" y="200" />
              <mxPoint x="1530" y="200" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-72" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;entryPerimeter=0;" parent="1" source="yTCr8bQdOqjygj6dUeAG-47" target="yTCr8bQdOqjygj6dUeAG-79" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="555" y="690" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-111" value="Cofinity-X Users" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" parent="1" vertex="1">
          <mxGeometry x="120" y="1210" width="1970" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-112" value="Admin" style="swimlane;html=1;startSize=20;horizontal=0;" parent="yTCr8bQdOqjygj6dUeAG-111" vertex="1">
          <mxGeometry x="20" width="1950" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-106" value="Recieve Mail" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=standard;symbol=message;" parent="yTCr8bQdOqjygj6dUeAG-112" vertex="1">
          <mxGeometry x="1810" y="20" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-124" value="Cofinity-X Services" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;fontStyle=1" parent="1" vertex="1">
          <mxGeometry x="121" y="1640" width="4140" height="480" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-174" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-124" source="yTCr8bQdOqjygj6dUeAG-171" target="yTCr8bQdOqjygj6dUeAG-164" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="689" y="60" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-176" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-124" source="yTCr8bQdOqjygj6dUeAG-164" target="yTCr8bQdOqjygj6dUeAG-175" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-125" value="Portal Admin View" style="swimlane;html=1;startSize=29;horizontal=0;" parent="yTCr8bQdOqjygj6dUeAG-124" vertex="1">
          <mxGeometry x="20" width="4120" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-160" value="Validate Company Data and Confirm (legal site address)" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="169" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-171" value="Check uploaded use case documents" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="469" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-178" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-125" source="yTCr8bQdOqjygj6dUeAG-175" target="yTCr8bQdOqjygj6dUeAG-177" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-175" value="Start Clearing House Process" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="659" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-177" value="Send Handelsregister Number and Name" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="859" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-184" value="Store participant credential in owner&#39;s MIW" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="1669" y="40" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--16" value="Start Legal Person SD-Creation" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="2039" y="40" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--33" value="Store part of SD in MIW&lt;br&gt;&lt;font color=&quot;#ff3333&quot;&gt;(what does part of SD mean?)&lt;/font&gt;" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="2874" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--42" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-125" source="64A1k_Dh1uGcnGidKPN--39" target="64A1k_Dh1uGcnGidKPN--41" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--39" value="Store generated VC" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="3409" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--44" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-125" source="64A1k_Dh1uGcnGidKPN--41" target="64A1k_Dh1uGcnGidKPN--43" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--41" value="Approve onboarded Member" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="3609" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--46" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-125" source="64A1k_Dh1uGcnGidKPN--43" target="64A1k_Dh1uGcnGidKPN--45" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--43" value="Send Mail with Technical User to Customer" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="3809" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--45" value="Mail to Customer" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=throwing;symbol=message;" parent="yTCr8bQdOqjygj6dUeAG-125" vertex="1">
          <mxGeometry x="4019" y="40" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-130" value="Business Partner &lt;br&gt;Number Issuer" style="swimlane;html=1;startSize=29;horizontal=0;" parent="yTCr8bQdOqjygj6dUeAG-124" vertex="1">
          <mxGeometry x="20" y="120" width="4120" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-162" value="Create BPNL Address" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-130" vertex="1">
          <mxGeometry x="309" y="40" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-145" value="Managed Identity Wallet" style="swimlane;html=1;startSize=29;fontStyle=1;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;" parent="yTCr8bQdOqjygj6dUeAG-124" vertex="1">
          <mxGeometry x="20" y="240" width="4120" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-164" value="Create Use case credentials" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-145" vertex="1">
          <mxGeometry x="469" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--14" value="Store Participant Credential in MIW" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-145" vertex="1">
          <mxGeometry x="1866" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--21" value="Sign Customer SD with Issuer Wallet" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-145" vertex="1">
          <mxGeometry x="2399" y="20" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--35" value="Store part of SD in MIW" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-145" vertex="1">
          <mxGeometry x="3074" y="20" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-144" value="&lt;b&gt;Self-Description Factory&lt;/b&gt;" style="swimlane;html=1;startSize=29;fontStyle=0;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;strokeColor=default;" parent="yTCr8bQdOqjygj6dUeAG-124" vertex="1">
          <mxGeometry x="20" y="360" width="4120" height="120" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--18" value="Create SD" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-144" vertex="1">
          <mxGeometry x="2219" y="25" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-163" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-124" source="yTCr8bQdOqjygj6dUeAG-160" target="yTCr8bQdOqjygj6dUeAG-162" edge="1">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="249" y="190" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-170" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" parent="yTCr8bQdOqjygj6dUeAG-124" source="yTCr8bQdOqjygj6dUeAG-162" target="yTCr8bQdOqjygj6dUeAG-171" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="519" y="60" as="targetPoint" />
            <Array as="points">
              <mxPoint x="389" y="60" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--15" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-124" source="yTCr8bQdOqjygj6dUeAG-184" target="64A1k_Dh1uGcnGidKPN--14" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--17" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-124" source="64A1k_Dh1uGcnGidKPN--14" target="64A1k_Dh1uGcnGidKPN--16" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--19" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-124" source="64A1k_Dh1uGcnGidKPN--16" target="64A1k_Dh1uGcnGidKPN--18" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--22" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-124" source="64A1k_Dh1uGcnGidKPN--18" target="64A1k_Dh1uGcnGidKPN--21" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--36" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-124" source="64A1k_Dh1uGcnGidKPN--33" target="64A1k_Dh1uGcnGidKPN--35" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-137" value="Cofinity-X Users" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" parent="1" vertex="1">
          <mxGeometry x="121" y="1470" width="4140" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-138" value="Admin" style="swimlane;html=1;startSize=20;horizontal=0;" parent="yTCr8bQdOqjygj6dUeAG-137" vertex="1">
          <mxGeometry x="20" width="4120" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-157" value="Recieve Mail" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=standard;symbol=message;" parent="yTCr8bQdOqjygj6dUeAG-138" vertex="1">
          <mxGeometry x="59" y="35" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-158" value="Open App-Request on Portal" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-138" vertex="1">
          <mxGeometry x="169" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-159" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-138" source="yTCr8bQdOqjygj6dUeAG-157" target="yTCr8bQdOqjygj6dUeAG-158" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-140" value="Onboarding Process" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;" parent="1" vertex="1">
          <mxGeometry x="120" y="1420" width="130" height="30" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-143" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="1" source="yTCr8bQdOqjygj6dUeAG-141" target="yTCr8bQdOqjygj6dUeAG-106" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-146" value="Clearing House" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" parent="1" vertex="1">
          <mxGeometry x="121" y="2160" width="4140" height="370" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-147" value="Notarization Service" style="swimlane;html=1;startSize=20;horizontal=0;" parent="yTCr8bQdOqjygj6dUeAG-146" vertex="1">
          <mxGeometry x="20" width="4120" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-181" value="Issue Participant Credential" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-147" vertex="1">
          <mxGeometry x="1419" y="25" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--31" value="Issue SD-VC (Generate full SD with all SD Data)" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-147" vertex="1">
          <mxGeometry x="3074" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-156" value="&lt;b&gt;Clearing House&lt;/b&gt;" style="swimlane;html=1;startSize=20;fontStyle=0;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=1;whiteSpace=wrap;" parent="yTCr8bQdOqjygj6dUeAG-146" vertex="1">
          <mxGeometry x="20" y="120" width="4120" height="120" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--12" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-156" source="64A1k_Dh1uGcnGidKPN--10" target="64A1k_Dh1uGcnGidKPN--11" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--10" value="Validate Request" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-156" vertex="1">
          <mxGeometry x="1074" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--11" value="Check recieved information" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-156" vertex="1">
          <mxGeometry x="1274" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--26" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-156" source="64A1k_Dh1uGcnGidKPN--23" target="64A1k_Dh1uGcnGidKPN--25" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--23" value="&lt;div&gt;Start GXDCH Process&lt;/div&gt;&lt;div&gt;&lt;font color=&quot;#ff3333&quot;&gt;(what is GXDCH?)&lt;/font&gt;&lt;br&gt;&lt;/div&gt;" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-156" vertex="1">
          <mxGeometry x="2539" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--30" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-156" source="64A1k_Dh1uGcnGidKPN--25" target="64A1k_Dh1uGcnGidKPN--29" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--25" value="Add GX SD Compliance VC" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-156" vertex="1">
          <mxGeometry x="2739" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--29" value="" style="points=[[0.25,0.25,0],[0.5,0,0],[0.75,0.25,0],[1,0.5,0],[0.75,0.75,0],[0.5,1,0],[0.25,0.75,0],[0,0.5,0]];shape=mxgraph.bpmn.gateway2;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=rhombusPerimeter;outlineConnect=0;outline=none;symbol=none;gwType=parallel;" parent="yTCr8bQdOqjygj6dUeAG-156" vertex="1">
          <mxGeometry x="2909" y="40" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--37" value="Recieve generated VC" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-156" vertex="1">
          <mxGeometry x="3269" y="30" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-152" value="Compliance Service" style="swimlane;html=1;startSize=20;horizontal=0;" parent="yTCr8bQdOqjygj6dUeAG-146" vertex="1">
          <mxGeometry x="20" y="240" width="4120" height="130" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--27" value="Validate created SD" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" parent="yTCr8bQdOqjygj6dUeAG-152" vertex="1">
          <mxGeometry x="2539" y="40" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--13" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-146" source="64A1k_Dh1uGcnGidKPN--11" target="yTCr8bQdOqjygj6dUeAG-181" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--28" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;startArrow=classic;startFill=1;" parent="yTCr8bQdOqjygj6dUeAG-146" source="64A1k_Dh1uGcnGidKPN--23" target="64A1k_Dh1uGcnGidKPN--27" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--32" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-146" source="64A1k_Dh1uGcnGidKPN--29" target="64A1k_Dh1uGcnGidKPN--31" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--38" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="yTCr8bQdOqjygj6dUeAG-146" source="64A1k_Dh1uGcnGidKPN--31" target="64A1k_Dh1uGcnGidKPN--37" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-161" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="1" source="yTCr8bQdOqjygj6dUeAG-158" target="yTCr8bQdOqjygj6dUeAG-160" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-185" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;dashed=1;" parent="1" source="yTCr8bQdOqjygj6dUeAG-181" target="yTCr8bQdOqjygj6dUeAG-184" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1745" y="2435" as="sourcePoint" />
            <mxPoint x="1770" y="1720" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-180" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;dashed=1;exitX=0.982;exitY=0.403;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" parent="1" source="yTCr8bQdOqjygj6dUeAG-177" target="64A1k_Dh1uGcnGidKPN--10" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1275" y="1725" as="sourcePoint" />
            <mxPoint x="1390" y="2350" as="targetPoint" />
            <Array as="points">
              <mxPoint x="1275" y="1694" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--24" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="1" source="64A1k_Dh1uGcnGidKPN--21" target="64A1k_Dh1uGcnGidKPN--23" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--34" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;dashed=1;" parent="1" source="64A1k_Dh1uGcnGidKPN--29" target="64A1k_Dh1uGcnGidKPN--33" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="64A1k_Dh1uGcnGidKPN--40" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="1" source="64A1k_Dh1uGcnGidKPN--37" target="64A1k_Dh1uGcnGidKPN--39" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
