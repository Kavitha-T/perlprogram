<?php

?>
<!DOCTYPE HTML>
<html>

<head>
<title> </title>
<link rel="stylesheet" type="text/css" href="style_dn_controller_tb.css">
<link type="text/css" rel="stylesheet" href="/css/font-awesome/font-awesome.css?1406016297" media="all" />
<script>

</script>

</head>

<body>
<div id='img'><img src="exeter_premedia_services.png" 
alt="Exeter Premedia Services" width="60%" style="display: block; margin: 40px auto;">
</div>

<div id = "div1" style ="overflow-x:auto;">

<form action="E:\Kavitha\Perl\db_copy_table_exeter.pl" method="post">
<table class = "table" cellspacing="8" cellpadding="8">
<tr>
<td><label class="label"> Url </label></td> 
<td><input type = "text" class="text" name="txturl" placeholder="Enter the Url"/></td></td>
</tr>

<tr>
<td><label class="label"> Site Name </label></td>
<td><input type = "text" class="text" name="txtsitename" placeholder="Enter the site-name"/></td>
</tr>

<tr>
<td><label class="label"> Version </label></td>
<td>
<select class="dropdown">  
      <option value = "cms-0.9.40-alpha-qa">cms-0.9.40-alpha-qa</option>
      <option value = "cms-0.9.40-alpha-qa">cms-0.9.40-alpha-qa-dev</option>
      <option value = "cms-0.9.40-alpha-qa">cms-0.9.40-alpha-qa-stg</option>
      <option value = "cms-kriya-bmj-abs-0.1">cms-kriya-bmj-abs-0.1</option>
      <option value = "cms-0.9.39-alpha">cms-0.9.39-alpha</option>
</select>
</td>
</tr>

<tr>
<td><label class="label"> Page Server </label></td>
<td>
<select class="dropdown">  
      <option value = "pag3.ama.uk.com:8099">pag3.ama.uk.com:8099</option>
      <option value = "pag2.ama.uk.com:8099">pag2.ama.uk.com:8099</option>
      <option value = "pag3.ama.uk.com">pag3.ama.uk.com</option>
</select>
</td>
</tr>

<tr>
<td><label class="label"> Web Server</label></td>
<td>
<select class="dropdown">  
      <option value = "cms30">cms30</option>
      <option value = "cms31">cms31</option>
      <option value = "cms32">cms32</option>
</select>
</td>
</tr>
<tr>
<td><input type ="submit" value="Submit" name="submit" class="button"/></td>
<td><input type ="submit" value="Cancel" name="cancel" class="button" />
</td>
</table>




</form>

</div>
</body>

</html>