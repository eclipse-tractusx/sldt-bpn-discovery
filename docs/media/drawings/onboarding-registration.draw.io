<mxfile host="app.diagrams.net" modified="2023-09-11T20:29:10.360Z" agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36" etag="IFTkO35iCyObuzxrwtYU" version="21.7.4" type="device">
  <diagram name="Seite-1" id="xKnN4ZHrS10Ob_aHEZOJ">
    <mxGraphModel dx="4968" dy="3200" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="yTCr8bQdOqjygj6dUeAG-14" value="IDP" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" vertex="1" parent="1">
          <mxGeometry x="120" y="300" width="710" height="240" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-16" value="Shared IDP" style="swimlane;html=1;startSize=20;horizontal=0;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-14">
          <mxGeometry x="20" width="690" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-24" value="Creates Keycloak Realm and User" style="whiteSpace=wrap;html=1;verticalAlign=top;rounded=1;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-16">
          <mxGeometry x="125" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-36" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-16" source="yTCr8bQdOqjygj6dUeAG-28" target="yTCr8bQdOqjygj6dUeAG-35">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-28" value="Assign Company-Admin Role" style="whiteSpace=wrap;html=1;verticalAlign=top;rounded=1;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-16">
          <mxGeometry x="310" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-35" value="Send One Time Password and Credentials to User" style="whiteSpace=wrap;html=1;verticalAlign=top;rounded=1;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-16">
          <mxGeometry x="510" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-15" value="Central IDP" style="swimlane;html=1;startSize=20;horizontal=0;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-14">
          <mxGeometry x="20" y="120" width="690" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-26" value="Creates Identity for SSO Providers and shared User" style="whiteSpace=wrap;html=1;verticalAlign=top;rounded=1;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-15">
          <mxGeometry x="125" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-27" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-14" source="yTCr8bQdOqjygj6dUeAG-24" target="yTCr8bQdOqjygj6dUeAG-26">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-29" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-14" source="yTCr8bQdOqjygj6dUeAG-26" target="yTCr8bQdOqjygj6dUeAG-28">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-19" value="User" style="swimlane;html=1;startSize=20;fontStyle=0;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;" vertex="1" parent="1">
          <mxGeometry x="120" y="100" width="710" height="130" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-23" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-19" source="yTCr8bQdOqjygj6dUeAG-20" target="yTCr8bQdOqjygj6dUeAG-22">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-20" value="Recieves Invite" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=standard;symbol=message;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-19">
          <mxGeometry x="50" y="35" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-22" value="Clicks On Link to Portal" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-19">
          <mxGeometry x="145" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-37" value="One Time Password" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=end;symbol=message;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-19">
          <mxGeometry x="565" y="35" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-25" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;dashed=1;" edge="1" parent="1" source="yTCr8bQdOqjygj6dUeAG-22" target="yTCr8bQdOqjygj6dUeAG-24">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-39" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=1;entryDx=0;entryDy=0;entryPerimeter=0;" edge="1" parent="1" source="yTCr8bQdOqjygj6dUeAG-35" target="yTCr8bQdOqjygj6dUeAG-37">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="710" y="220" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-40" value="Initial IDP Registration" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;" vertex="1" parent="1">
          <mxGeometry x="120" y="40" width="140" height="30" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-41" value="Portal Registration" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;" vertex="1" parent="1">
          <mxGeometry x="130" y="600" width="120" height="30" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-42" value="User" style="swimlane;html=1;startSize=20;fontStyle=0;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;" vertex="1" parent="1">
          <mxGeometry x="120" y="632" width="1970" height="128" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-43" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-42" source="yTCr8bQdOqjygj6dUeAG-44" target="yTCr8bQdOqjygj6dUeAG-45">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-44" value="One Time Password" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=standard;symbol=message;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-42">
          <mxGeometry x="50" y="30" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-48" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-42" source="yTCr8bQdOqjygj6dUeAG-45" target="yTCr8bQdOqjygj6dUeAG-47">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-45" value="Navigate to Portal" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-42">
          <mxGeometry x="150" y="25" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-47" value="Search for Company by Name and Login with Credentials" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-42">
          <mxGeometry x="345" y="25" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-50" value="Cofinity-X Services" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" vertex="1" parent="1">
          <mxGeometry x="120" y="800" width="1970" height="370" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-51" value="Portal" style="swimlane;html=1;startSize=20;horizontal=0;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-50">
          <mxGeometry x="20" width="1950" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-86" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-79" target="yTCr8bQdOqjygj6dUeAG-85">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-79" value="" style="points=[[0.25,0.25,0],[0.5,0,0],[0.75,0.25,0],[1,0.5,0],[0.75,0.75,0],[0.5,1,0],[0.25,0.75,0],[0,0.5,0]];shape=mxgraph.bpmn.gateway2;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=rhombusPerimeter;outlineConnect=0;outline=none;symbol=none;gwType=parallel;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-51">
          <mxGeometry x="360" y="40" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-88" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-85" target="yTCr8bQdOqjygj6dUeAG-87">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-85" value="Insert Company Details" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-51">
          <mxGeometry x="450" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-90" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-87" target="yTCr8bQdOqjygj6dUeAG-89">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-87" value="Invite other Users" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-51">
          <mxGeometry x="650" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-92" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-89" target="yTCr8bQdOqjygj6dUeAG-91">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-89" value="Select Routes?" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-51">
          <mxGeometry x="850" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-95" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-91" target="yTCr8bQdOqjygj6dUeAG-94">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-91" value="Upload Handelsregister Auszug" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-51">
          <mxGeometry x="1050" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-102" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-94" target="yTCr8bQdOqjygj6dUeAG-101">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-94" value="User Confirms" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-51">
          <mxGeometry x="1250" y="35" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-142" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-51" source="yTCr8bQdOqjygj6dUeAG-101" target="yTCr8bQdOqjygj6dUeAG-141">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-101" value="" style="points=[[0.25,0.25,0],[0.5,0,0],[0.75,0.25,0],[1,0.5,0],[0.75,0.75,0],[0.5,1,0],[0.25,0.75,0],[0,0.5,0]];shape=mxgraph.bpmn.gateway2;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=rhombusPerimeter;outlineConnect=0;outline=none;symbol=none;gwType=parallel;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-51">
          <mxGeometry x="1464" y="40" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-141" value="Send Mail to Cofinity-X Admin" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=throwing;symbol=message;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-51">
          <mxGeometry x="1810" y="40" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-84" value="BMPNL Discovery?" style="swimlane;html=1;startSize=20;fontStyle=0;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-50">
          <mxGeometry x="20" y="120" width="1950" height="130" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-123" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-84" source="yTCr8bQdOqjygj6dUeAG-71" target="yTCr8bQdOqjygj6dUeAG-122">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-71" value="Lookup BMNL&amp;nbsp;" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-84">
          <mxGeometry x="445" y="39" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-122" value="" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=end;symbol=terminate2;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-84">
          <mxGeometry x="620" y="44" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-75" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;exitPerimeter=0;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-50" source="yTCr8bQdOqjygj6dUeAG-79" target="yTCr8bQdOqjygj6dUeAG-71">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="435" y="-60" as="sourcePoint" />
            <mxPoint x="435" y="160" as="targetPoint" />
            <Array as="points">
              <mxPoint x="405" y="189" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-98" value="MIW" style="swimlane;html=1;startSize=20;fontStyle=0;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-50">
          <mxGeometry x="20" y="250" width="1950" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-100" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-98" source="yTCr8bQdOqjygj6dUeAG-96" target="yTCr8bQdOqjygj6dUeAG-99">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-96" value="MIW Generates Wallet for BPN" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-98">
          <mxGeometry x="1250" y="20" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-104" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;entryPerimeter=0;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-98" source="yTCr8bQdOqjygj6dUeAG-99" target="yTCr8bQdOqjygj6dUeAG-105">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1670" y="50" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-99" value="&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;&quot;&gt;Create Membership + BPN Credential + DID-Document&lt;/span&gt;" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-98">
          <mxGeometry x="1450" y="20" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-105" value="" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=end;symbol=terminate2;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-98">
          <mxGeometry x="1670" y="25" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-97" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;exitPerimeter=0;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-50" source="yTCr8bQdOqjygj6dUeAG-101" target="yTCr8bQdOqjygj6dUeAG-96">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1509" y="200" />
              <mxPoint x="1330" y="200" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-72" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;entryPerimeter=0;" edge="1" parent="1" source="yTCr8bQdOqjygj6dUeAG-47" target="yTCr8bQdOqjygj6dUeAG-79">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="555" y="690" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-111" value="Cofinity-X Users" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" vertex="1" parent="1">
          <mxGeometry x="120" y="1210" width="1970" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-112" value="Admin" style="swimlane;html=1;startSize=20;horizontal=0;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-111">
          <mxGeometry x="20" width="1950" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-106" value="Recieve Mail" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=standard;symbol=message;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-112">
          <mxGeometry x="1810" y="20" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-124" value="Cofinity-X Services" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" vertex="1" parent="1">
          <mxGeometry x="121" y="1640" width="2280" height="480" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-174" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-124" source="yTCr8bQdOqjygj6dUeAG-171" target="yTCr8bQdOqjygj6dUeAG-164">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="689" y="60" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-176" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-124" source="yTCr8bQdOqjygj6dUeAG-164" target="yTCr8bQdOqjygj6dUeAG-175">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-125" value="Portal Admin View" style="swimlane;html=1;startSize=20;horizontal=0;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-124">
          <mxGeometry x="20" width="2260" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-160" value="Validate Company Data and Confirm" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-125">
          <mxGeometry x="169" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-171" value="Check uploaded use case Documents" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-125">
          <mxGeometry x="469" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-178" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-125" source="yTCr8bQdOqjygj6dUeAG-175" target="yTCr8bQdOqjygj6dUeAG-177">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-175" value="Start Clearing House Process" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-125">
          <mxGeometry x="659" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-191" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-125" source="yTCr8bQdOqjygj6dUeAG-177" target="yTCr8bQdOqjygj6dUeAG-190">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-177" value="Send Handelsregister Number and Name" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-125">
          <mxGeometry x="859" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-193" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-125" source="yTCr8bQdOqjygj6dUeAG-190" target="yTCr8bQdOqjygj6dUeAG-192">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-190" value="" style="points=[[0.25,0.25,0],[0.5,0,0],[0.75,0.25,0],[1,0.5,0],[0.75,0.75,0],[0.5,1,0],[0.25,0.75,0],[0,0.5,0]];shape=mxgraph.bpmn.gateway2;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=rhombusPerimeter;outlineConnect=0;outline=none;symbol=none;gwType=parallel;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-125">
          <mxGeometry x="1109" y="35" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-192" value="Send other Data to clearing House" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-125">
          <mxGeometry x="1689" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-130" value="BPN Issuer" style="swimlane;html=1;startSize=20;horizontal=0;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-124">
          <mxGeometry x="20" y="120" width="2260" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-162" value="Create BPNL Address" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-130">
          <mxGeometry x="309" y="40" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-145" value="MIW" style="swimlane;html=1;startSize=20;fontStyle=0;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-124">
          <mxGeometry x="20" y="240" width="2260" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-164" value="Create Use case credentials" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-145">
          <mxGeometry x="469" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-184" value="Store in MIW" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-145">
          <mxGeometry x="1544" y="25" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-144" value="Portal Task Schedule" style="swimlane;html=1;startSize=20;fontStyle=0;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=2;whiteSpace=wrap;strokeColor=default;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-124">
          <mxGeometry x="20" y="360" width="2260" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-163" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-124" source="yTCr8bQdOqjygj6dUeAG-160" target="yTCr8bQdOqjygj6dUeAG-162">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="249" y="190" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-170" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-124" source="yTCr8bQdOqjygj6dUeAG-162" target="yTCr8bQdOqjygj6dUeAG-171">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="519" y="60" as="targetPoint" />
            <Array as="points">
              <mxPoint x="389" y="60" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-137" value="Cofinity-X Users" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" vertex="1" parent="1">
          <mxGeometry x="121" y="1470" width="2280" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-138" value="Admin" style="swimlane;html=1;startSize=20;horizontal=0;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-137">
          <mxGeometry x="20" width="2260" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-157" value="Recieve Mail" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=standard;symbol=message;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-138">
          <mxGeometry x="59" y="35" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-158" value="Open App-Request on Portal" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-138">
          <mxGeometry x="169" y="30" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-159" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-138" source="yTCr8bQdOqjygj6dUeAG-157" target="yTCr8bQdOqjygj6dUeAG-158">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-140" value="Onboarding Process" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;" vertex="1" parent="1">
          <mxGeometry x="120" y="1420" width="130" height="30" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-143" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="yTCr8bQdOqjygj6dUeAG-141" target="yTCr8bQdOqjygj6dUeAG-106">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-146" value="Clearing House" style="swimlane;html=1;childLayout=stackLayout;resizeParent=1;resizeParentMax=0;horizontal=0;startSize=20;horizontalStack=0;whiteSpace=wrap;" vertex="1" parent="1">
          <mxGeometry x="121" y="2160" width="2280" height="360" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-147" value="Notarization Service" style="swimlane;html=1;startSize=20;horizontal=0;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-146">
          <mxGeometry x="20" width="2260" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-156" value="Clearing House" style="swimlane;html=1;startSize=20;fontStyle=0;collapsible=0;horizontal=0;swimlaneLine=1;swimlaneFillColor=none;strokeWidth=1;whiteSpace=wrap;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-146">
          <mxGeometry x="20" y="120" width="2260" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-183" value="Recieve Participant VC request" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=eventNonint;symbol=message;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-156">
          <mxGeometry x="1249" y="40" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-180" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;dashed=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;exitPerimeter=0;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-156" source="yTCr8bQdOqjygj6dUeAG-190">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1133.62" y="-550" as="sourcePoint" />
            <mxPoint x="1249" y="70" as="targetPoint" />
            <Array as="points">
              <mxPoint x="1134" y="70" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-196" value="Recieve request" style="points=[[0.145,0.145,0],[0.5,0,0],[0.855,0.145,0],[1,0.5,0],[0.855,0.855,0],[0.5,1,0],[0.145,0.855,0],[0,0.5,0]];shape=mxgraph.bpmn.event;html=1;verticalLabelPosition=bottom;labelBackgroundColor=#ffffff;verticalAlign=top;align=center;perimeter=ellipsePerimeter;outlineConnect=0;aspect=fixed;outline=eventNonint;symbol=message;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-156">
          <mxGeometry x="1724" y="40" width="50" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-152" value="Compliance Service" style="swimlane;html=1;startSize=20;horizontal=0;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-146">
          <mxGeometry x="20" y="240" width="2260" height="120" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-181" value="Check UST Number and Create Participant Credential&amp;nbsp;" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;labelBackgroundColor=#ffffff;" vertex="1" parent="yTCr8bQdOqjygj6dUeAG-152">
          <mxGeometry x="1364" y="25" width="120" height="70" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-182" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;exitPerimeter=0;" edge="1" parent="yTCr8bQdOqjygj6dUeAG-146" source="yTCr8bQdOqjygj6dUeAG-183" target="yTCr8bQdOqjygj6dUeAG-181">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1324" y="180" as="sourcePoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-161" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="yTCr8bQdOqjygj6dUeAG-158" target="yTCr8bQdOqjygj6dUeAG-160">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-185" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" edge="1" parent="1" source="yTCr8bQdOqjygj6dUeAG-181" target="yTCr8bQdOqjygj6dUeAG-184">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1745" y="2435" as="sourcePoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yTCr8bQdOqjygj6dUeAG-195" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;dashed=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;entryPerimeter=0;" edge="1" parent="1" source="yTCr8bQdOqjygj6dUeAG-192" target="yTCr8bQdOqjygj6dUeAG-196">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1890" y="2320" as="targetPoint" />
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
