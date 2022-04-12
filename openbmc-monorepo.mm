<map version="1.1.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1649637160715" ID="ID_1194363365" MODIFIED="1649639162229" TEXT="OpenBMC is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638025985" ID="ID_453932440" MODIFIED="1649639179112" POSITION="right" TEXT="Problems">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638238571" ID="ID_1022427257" MODIFIED="1649639179089" TEXT="Yocto is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638273752" ID="ID_1019369000" MODIFIED="1649638274708" TEXT="- It would allow most developers to not need to understand Yocto at all to do their day to day work on existing applications.  No more &quot;devtool modify&quot;, and related SRCREV bumps.  This will help most of the new developers on the project with a lower mental load, which will mean people are able to ramp up faster.."/>
</node>
<node CREATED="1649638351473" ID="ID_621361409" MODIFIED="1649639179110" TEXT="Coordinating breaking changes is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638364304" ID="ID_615742703" MODIFIED="1649638365623" TEXT="- There would be a reduction in reviews.  Today, anytime a person wants to make a change that would involve any part of the tree, there&apos;s at least 2 code reviews, one for the commit, and one for the recipe bump.  Compared to a single tree, this at least doubles the number of reviews we need to process.  For changes that want to make any change to a few subsystems, as is the case when developing a feature, they require 2 X &lt;number of project changes&gt; reviews, all of which need to be synchronized.  There is a well documented problem where we have no official way to synchronize merging of changes to userspace applications within a bump without manual human intervention.  This would largely render that problem moot."/>
</node>
<node CREATED="1649638398509" ID="ID_1886928658" MODIFIED="1649639179110" TEXT="Bug reports are ignored">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638433293" ID="ID_359851573" MODIFIED="1649638434520" TEXT="- It would centralize the bug databases.  Today, bugs filed against sub projects tend to not get answered.  Having all the bugs in openbmc/openbmc would help in the future to avoid duplicating bugs across projects."/>
</node>
<node CREATED="1649638415950" ID="ID_1740435166" MODIFIED="1649639179109" TEXT="Bug reports are duplicated across repos">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638439014" ID="ID_1170279909" MODIFIED="1649638440347" TEXT="- It would centralize the bug databases.  Today, bugs filed against sub projects tend to not get answered.  Having all the bugs in openbmc/openbmc would help in the future to avoid duplicating bugs across projects."/>
</node>
<node CREATED="1649638486404" ID="ID_770048606" MODIFIED="1649639179108" TEXT="Working out where to submit a patch is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638511526" ID="ID_269119378" MODIFIED="1649638512982" TEXT="- Would increase the likelihood that someone contributes a patch, especially a patch written by someone else.  If contributing a patch was just a matter of cherry-picking a tree of commits and submitting it to gerrit, it&apos;s a lot more likely that people would do it."/>
</node>
<node CREATED="1649638576464" ID="ID_499927876" MODIFIED="1649639179105" TEXT="Querying properties over the project is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638616094" ID="ID_1728131585" MODIFIED="1649638633750" TEXT="- Greatly increases the ease with which stats are collected.&#xa;Questions like: How many patches were submitted last year?  How many&#xa;lines of code changed between commit A and commit B?  Where was this&#xa;regression injected (ie git bisect)?  How much of our codebase is C++?&#xa;How many users of the dbus Sensor.Value interface are there?  Are all&#xa;easily answered in one liner git commands once this change is done."/>
</node>
<node CREATED="1649638711482" ID="ID_1519515584" MODIFIED="1649639179103" TEXT="New repo requests are bottlenecked">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638757526" ID="ID_1100825250" MODIFIED="1649638758467" TEXT="- New features no longer require single-point-of-contact core maintainer processes (ie, creating a repo for changes, setting up maintainer groups, ect) and can just be submitted as a series of patches to openbmc/openbmc."/>
</node>
<node CREATED="1649638859183" ID="ID_597978888" MODIFIED="1649639179102" TEXT="Coordinating tree-wide changes is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638872672" ID="ID_1221063525" MODIFIED="1649638873469" TEXT=" - Tree-wide changes (c++ standard, yocto updates, formatting, ect) are much easier to accomplish in a small number of patches, or a series of patches that is easy to pull and test as a unit."/>
</node>
</node>
<node CREATED="1649638038373" ID="ID_357490952" MODIFIED="1649639179111" POSITION="left" TEXT="Desires">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638048911" ID="ID_1558092718" MODIFIED="1649639155887" TEXT="A set of application and distro changes are easily shareable">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638159209" ID="ID_1965888675" MODIFIED="1649638164902" TEXT="- The tree would be easily shareable amongst the various people working on OpenBMC, without having to rely on a single-source Gerrit instance.  Git is designed to be distributed, but if our recipe files point at other repositories, it largely defeats a lot of this capability.  Today, if you want to share a tree that has a change in it, you have to fork the main tree, then fork every single subproject you&apos;ve made modifications to, then update the main tree to point to your forks.  This gets very onerous over time, especially for simple commits.  Having maintained several different companies forks personally, and spoken to many others having problems with the same, adding major features are difficult to test and rebase because of this.  Moving the code to a single tree makes a lot of the toil of tagging and modifying local trees a lot more manageable, as a series of well-documented git commands (generally git rebase[2]).  It also increases the likelihood that someone pulls down the fork to test it if it&apos;s highly likely that they can apply it to their own tree in a single command."/>
</node>
<node CREATED="1649638107436" ID="ID_1282412748" MODIFIED="1649639159136" TEXT="Minimise reviews">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638224044" ID="ID_1545046942" MODIFIED="1649638227475" TEXT="- There would be a reduction in reviews.  Today, anytime a person wants to make a change that would involve any part of the tree, there&apos;s at least 2 code reviews, one for the commit, and one for the recipe bump.  Compared to a single tree, this at least doubles the number of reviews we need to process.  For changes that want to make any change to a few subsystems, as is the case when developing a feature, they require 2 X &lt;number of project changes&gt; reviews, all of which need to be synchronized.  There is a well documented problem where we have no official way to synchronize merging of changes to userspace applications within a bump without manual human intervention.  This would largely render that problem moot."/>
</node>
<node CREATED="1649638300826" ID="ID_712434388" MODIFIED="1649639166454" TEXT="Make fork maintenance easy">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638320484" ID="ID_319511260" MODIFIED="1649638321571" TEXT="- It would give an opportunity for individuals and companies to &quot;own&quot; well-supported public forks (ie Redhat) of the codebase, which would increase participation in the project overall.  This already happens quite a bit, but in practice, the forks that do it squash history, making it nearly impossible to get their changes upstreamed from an outside entity."/>
</node>
<node CREATED="1649638446175" ID="ID_1065960715" MODIFIED="1649639179113" TEXT="Provide one place to report bugs across the entire project">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638462251" ID="ID_1705498055" MODIFIED="1649638463226" TEXT="- It would centralize the bug databases.  Today, bugs filed against sub projects tend to not get answered.  Having all the bugs in openbmc/openbmc would help in the future to avoid duplicating bugs across projects."/>
</node>
<node CREATED="1649638642855" ID="ID_747960128" MODIFIED="1649639179115" TEXT="Minimise effort collecting project statistics">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638665308" ID="ID_1327737686" MODIFIED="1649638666490" TEXT="- Greatly increases the ease with which stats are collected. Questions like: How many patches were submitted last year?  How many lines of code changed between commit A and commit B?  Where was this regression injected (ie git bisect)?  How much of our codebase is C++? How many users of the dbus Sensor.Value interface are there?  Are all easily answered in one liner git commands once this change is done."/>
</node>
<node CREATED="1649638768303" ID="ID_407777683" MODIFIED="1649639179114" TEXT="Make it easy to add new applications">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638796592" ID="ID_920761676" MODIFIED="1649638797614" TEXT="- New features no longer require single-point-of-contact core maintainer processes (ie, creating a repo for changes, setting up maintainer groups, ect) and can just be submitted as a series of patches to openbmc/openbmc."/>
</node>
<node CREATED="1649638831366" ID="ID_1856098282" MODIFIED="1649639179114" TEXT="Make it easy to refactor across the entire project">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638843325" ID="ID_623432561" MODIFIED="1649638844359" TEXT=" - Tree-wide changes (c++ standard, yocto updates, formatting, ect) are much easier to accomplish in a small number of patches, or a series of patches that is easy to pull and test as a unit."/>
</node>
<node CREATED="1649638967958" ID="ID_622635322" MODIFIED="1649639179113" TEXT="Inclusive naming">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638998497" ID="ID_746595646" MODIFIED="1649638999291" TEXT="- Inclusive guidelines: To make progress toward an unrelated but important goal at the same time, I&apos;m recommending that the openbmc/master branch will be left as-is, and the newly-created sha1 will be pushed to the branch openbmc/openbmc:main, to retain peoples links to previous commits on master, and retain the exact project history while at the same time moving the project to having more inclusive naming, as has been documented previously[3].  At some point in the future the master branch could be renamed and deprecated, but this is considered out of scope for this specific change."/>
</node>
</node>
</node>
</map>
