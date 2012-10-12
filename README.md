Electric Pitchfork
==================

A collection of base object definitions for use with the Electric Imp, this is designed to be a shared repository for software - please add new sensor or update implementations as you have them. Ideally, we can make a common set of base objects for Electric Imp projects that can be used in a mix-and-match format.

Comments for new implementations should abide by the following

<pre>
// General Name
//
// Requires: < other required files, if none do not add >
// 
// Usage:
// < quick usage details. >
</pre>

A neat fallout of this project is you can quickly generate all your base boilerplate code set by concatenating the appropriate files. Like for example if I wanted to build a temperature sensor system for the Hannah board system, I would simply execute the following in the electric-pitchfork directory:

<pre>
	> cat io-expander.squirrel temperature.squirrel > tempsys.squirrel
</pre>

Then simply modify the tempsys.squirrel file and you are off to the races!