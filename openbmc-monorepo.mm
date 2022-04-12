<map version="1.1.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1649637160715" ID="ID_1194363365" MODIFIED="1649639162229" TEXT="OpenBMC is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638025985" ID="ID_453932440" MODIFIED="1649639179112" POSITION="right" TEXT="Problems">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638238571" ID="ID_1022427257" MODIFIED="1649639179089" TEXT="Yocto is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638273752" ID="ID_1019369000" MODIFIED="1649638274708" TEXT="- It would allow most developers to not need to understand Yocto at all to do their day to day work on existing applications.  No more &quot;devtool modify&quot;, and related SRCREV bumps.  This will help most of the new developers on the project with a lower mental load, which will mean people are able to ramp up faster..">
<node CREATED="1649722943772" ID="ID_955055563" MODIFIED="1649722945403" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
<node CREATED="1649723131295" ID="ID_505026713" MODIFIED="1649723222494" TEXT="Managing patch stacks is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649723144817" ID="ID_1048371471" MODIFIED="1649723148400" TEXT="As most people that have stacked patches can attest to, managing patch files in a meta layer over time is very difficult (unless you meant something else).  Yes, I should not have said &quot;have to&quot;, but a number of the forks that I&apos;ve seen have ended up resorting to that. Example: (https://github.com/opencomputeproject/HWMgmt-MegaRAC-OpenEdition/tree/master/openbmc_modules)">
<node CREATED="1649723150157" ID="ID_560682988" MODIFIED="1649723166098" TEXT="https://lore.kernel.org/openbmc/CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com/"/>
</node>
<node CREATED="1649723650626" ID="ID_25672350" MODIFIED="1649723652336" TEXT="Meta layer patch files in my experience tend to not layer well, and require a good amount of maintenance.  They also have problems where they&apos;re not versioned against a git base, so there&apos;s no guarantees of where in the history the patches were forked from, and whether they apply to your tree, or if they fail, what patches likely caused them to fail.  Admittedly, tracking them in git isn&apos;t perfect either, but at least it publishes &quot;this is the source base these were based on&quot; to give some indication.  In practice, the public forks I&apos;ve seen just embed the custom meta layer within an openbmc tree to solve this problem. https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods https://github.com/HewlettPackard/openbmc">
<node CREATED="1649723661014" ID="ID_1679157082" MODIFIED="1649723662100" TEXT="https://lore.kernel.org/openbmc/CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com/"/>
</node>
<node CREATED="1649724219256" ID="ID_1223101452" MODIFIED="1649724220752" TEXT="Managing a few patch files for a single machine in a single meta-layer doesn&apos;t have much overhead, but the complexity scales superlinearly with more machines, distro features that may be on or off, other meta-layers trying to add patches, etc. The usual &quot;solution&quot; to this that I see is just avoiding rebasing to newer versions of OpenBMC, which makes upstreaming patches even more difficult in a vicious cycle.">
<node CREATED="1649724227443" ID="ID_1558744411" MODIFIED="1649724228331" TEXT="https://lore.kernel.org/openbmc/CADKL2t54-0kUXjDdqajHun4ssQ1WO2gYcH8F9QE8Xnbuoz91kg@mail.gmail.com/"/>
</node>
<node CREATED="1649724805439" ID="ID_312919927" MODIFIED="1649724807070" TEXT="A few reasons: 1. When patches conflict, resolving the rebase conflicts is a manual, difficult process. 2. Many devs aren&apos;t familiar with the available tools (given the overflow of documentation) and can sometimes resort to rewriting patch files by hand because they&apos;re nor familiar with the relevant tooling. 3. Patches sometimes apply to one system, sometimes apply to all systems, and generally cause a complex tree of dependencies.  If Yocto has a patch file, then openbmc has the same patch file, then a private meta layer has the same patch file, there&apos;s no mechanism for &quot;patch already applied to upstream&quot; like git rebase has.  If certain systems have pinned a given version of a subproject because of a regression, there&apos;s no easy way to apply different versions of patch files pre and post regression. 4. Patches could be applied at vendor-level, platform-level, SOC level, or distro-level, and explaining all of these concepts to new engineers is difficult.  In practice, most will opt for checking it into the lowest friction place.  No, I don&apos;t believe it&apos;s lack of documentation.  Yocto documents workflows very well, there&apos;s just way too much of it to expect anyone to read it in that level of depth. ">
<node CREATED="1649724815096" ID="ID_697258918" MODIFIED="1649724816080" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAz1i4tEbs0zTSi2yqth8dtqAVGtcvaYx4bCw+5R3f8VQ@mail.gmail.com/"/>
</node>
<node CREATED="1649725222783" ID="ID_464601197" MODIFIED="1649725223569" TEXT="Because the patches were applied and tested against a particular version of the tree.  If you change the tree they&apos;re based on, you generally invalidate your testing, which hopefully pops up in a merge conflict, but doesn&apos;t always. ">
<node CREATED="1649725227009" ID="ID_1254160536" MODIFIED="1649725227485" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAz1i4tEbs0zTSi2yqth8dtqAVGtcvaYx4bCw+5R3f8VQ@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649723273716" ID="ID_681516562" MODIFIED="1649723396406" TEXT="Custom tooling is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649723291468" ID="ID_1907533010" MODIFIED="1649723293457" TEXT="devtool provides just one form of friction;  There are also a number of cases where devtool modify and devtool finish fail in non obvious ways (usually due to some not-quite-optimal yocto handling in a meta layer, or patches being distributed across meta layers).  The biggest key is that it&apos;s yet another tool that seasoned firmware developers have to learn to jump into our codebase.  Each tool adds some friction compared to if it just didn&apos;t exist.  It also adds the &quot;which recipe do I need to devtool to modify the webui?&quot; type trouble that people have talked about many times.">
<node CREATED="1649723295645" ID="ID_1925318655" MODIFIED="1649723308342" TEXT="https://lore.kernel.org/openbmc/CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com/"/>
</node>
<node CREATED="1649724262428" ID="ID_24907794" MODIFIED="1649724263756" TEXT=" &quot;devtool modify&quot; -&gt; &quot;devtool finish&quot; does this workflow, but I&apos;ve seen it fail in subtle, difficult to debug ways many times before (although to be fair, it has gotten more reliable in the last year or so).">
<node CREATED="1649724272046" ID="ID_791839733" MODIFIED="1649724273039" TEXT="https://lore.kernel.org/openbmc/CADKL2t54-0kUXjDdqajHun4ssQ1WO2gYcH8F9QE8Xnbuoz91kg@mail.gmail.com/"/>
</node>
<node CREATED="1649724330064" ID="ID_187562955" MODIFIED="1649724331316" TEXT="That&apos;s the usual way I use devtool too, but note that using it this way prevents &quot;devtool finish&quot; from working properly.  Also cloning all the OpenBMC repos in a centralized workspace and then pointing the OpenBMC recipes at them is the exact workflow that Ed is proposing, just in an automated fashion and without the toil of having to sync and generate patch files from these repos individually.">
<node CREATED="1649724335936" ID="ID_1772743499" MODIFIED="1649724336824" TEXT="https://lore.kernel.org/openbmc/CADKL2t54-0kUXjDdqajHun4ssQ1WO2gYcH8F9QE8Xnbuoz91kg@mail.gmail.com/"/>
</node>
<node CREATED="1649724961183" ID="ID_964743154" MODIFIED="1649724962682" TEXT="I think it&apos;s supposed to be bitbake finish, but from our experience it doesn&apos;t handle scale very well.  If we write another tool, then we&apos;re back to &quot;tool that you need to know exists to use&quot;.  git is a tool that exists, and has these features already;  We should avoid writing openbmc-specific tools where we can.">
<node CREATED="1649724966806" ID="ID_1034023290" MODIFIED="1649724967589" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAz1i4tEbs0zTSi2yqth8dtqAVGtcvaYx4bCw+5R3f8VQ@mail.gmail.com/"/>
</node>
<node CREATED="1649725174073" ID="ID_1130885485" MODIFIED="1649725175231" TEXT="Might be reasonable, although I would point out that workflow scripts still require the user to know they exist.  If we&apos;re talking about workflow scripts around &quot;devtool all openbmc recipes&quot; and &quot;roll up openbmc changes into review and send&quot;, that gets us closer in the &quot;how do I open reviews&quot; regard, but I&apos;m not sure that&apos;s the right approach.">
<node CREATED="1649725179960" ID="ID_1445392621" MODIFIED="1649725180560" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAz1i4tEbs0zTSi2yqth8dtqAVGtcvaYx4bCw+5R3f8VQ@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649723351107" ID="ID_201666823" MODIFIED="1649723358634" TEXT="Finding the right recipe is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649723361391" ID="ID_1941872740" MODIFIED="1649723373670" TEXT="devtool provides just one form of friction;  There are also a number of cases where devtool modify and devtool finish fail in non obvious ways (usually due to some not-quite-optimal yocto handling in a meta layer, or patches being distributed across meta layers).  The biggest key is that it&apos;s yet another tool that seasoned firmware developers have to learn to jump into our codebase.  Each tool adds some friction compared to if it just didn&apos;t exist.  It also adds the &quot;which recipe do I need to devtool to modify the webui?&quot; type trouble that people have talked about many times. ">
<node CREATED="1649723382049" ID="ID_1069248791" MODIFIED="1649723383267" TEXT="https://lore.kernel.org/openbmc/CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649723816372" ID="ID_1354268998" MODIFIED="1649723824157" TEXT="Yocto has too much documentation">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649723827368" ID="ID_744045225" MODIFIED="1649723864377" TEXT="Lots of experienced openbmc developers use devtool every day, I&apos;m not saying it&apos;s not useful, it&apos;s just one more tool.  &quot;more documentation&quot; I don&apos;t think solves this, given that devtool is already well documented in the multi-hundred page mega manual;  Between openbmc docs, yocto docs, and the docs of the projects we pull in, there&apos;s already more documentation than a developer can read when ramping up. The best kind of documentation is that kind that doesn&apos;t need to exist;  The second best kind is where we can point to very well used-in-industry and maintained projects (ie git) and rely on their documentation.">
<node CREATED="1649723861647" ID="ID_890989568" MODIFIED="1649723862565" TEXT="https://lore.kernel.org/openbmc/CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com/"/>
</node>
</node>
</node>
<node CREATED="1649638351473" ID="ID_621361409" MODIFIED="1649639179110" TEXT="Coordinating breaking changes is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638364304" ID="ID_615742703" MODIFIED="1649638365623" TEXT="- There would be a reduction in reviews.  Today, anytime a person wants to make a change that would involve any part of the tree, there&apos;s at least 2 code reviews, one for the commit, and one for the recipe bump.  Compared to a single tree, this at least doubles the number of reviews we need to process.  For changes that want to make any change to a few subsystems, as is the case when developing a feature, they require 2 X &lt;number of project changes&gt; reviews, all of which need to be synchronized.  There is a well documented problem where we have no official way to synchronize merging of changes to userspace applications within a bump without manual human intervention.  This would largely render that problem moot.">
<node CREATED="1649722956882" ID="ID_1194546179" MODIFIED="1649722960341" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
<node CREATED="1649723743484" ID="ID_582757531" MODIFIED="1649723744785" TEXT="Admittedly, not every commit gets easier, but there are a lot of commits that would now synchronize better.  Just this morning I had a case of this in bmcweb, so it happens a lot.  I also think that having one or a smaller number of reviews would concentrate a lot of the discussion when we make treewide changes.  (OWNERS files, ect)  When they get distributed among many reviews, in my experience it tends to dilute the discussion a bit.">
<node CREATED="1649723750240" ID="ID_1410900193" MODIFIED="1649723751303" TEXT="https://lore.kernel.org/openbmc/CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com/"/>
</node>
<node CREATED="1649724996724" ID="ID_1726215423" MODIFIED="1649724997852" TEXT="Yes, you, me, or the other maintainers can hack up shell scripts to do what we need in short order.  This doesn&apos;t help more junior developers for which coding doesn&apos;t flow as naturally.  Also, if we, the core maintainers, are having to hack up shell scripts every time we want to do some kind of analysis/changes, that&apos;s not an efficient use of our time either.">
<node CREATED="1649725005461" ID="ID_22945998" MODIFIED="1649725006100" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAz1i4tEbs0zTSi2yqth8dtqAVGtcvaYx4bCw+5R3f8VQ@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638398509" ID="ID_1886928658" MODIFIED="1649639179110" TEXT="Bug reports are ignored">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638433293" ID="ID_359851573" MODIFIED="1649638434520" TEXT="- It would centralize the bug databases.  Today, bugs filed against sub projects tend to not get answered.  Having all the bugs in openbmc/openbmc would help in the future to avoid duplicating bugs across projects.">
<node CREATED="1649722962110" ID="ID_144185493" MODIFIED="1649722964611" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638415950" ID="ID_1740435166" MODIFIED="1649639179109" TEXT="Bug reports are duplicated across repos">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638439014" ID="ID_1170279909" MODIFIED="1649638440347" TEXT="- It would centralize the bug databases.  Today, bugs filed against sub projects tend to not get answered.  Having all the bugs in openbmc/openbmc would help in the future to avoid duplicating bugs across projects.">
<node CREATED="1649722965690" ID="ID_941901370" MODIFIED="1649722967658" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638486404" ID="ID_770048606" MODIFIED="1649639179108" TEXT="Working out where to submit a patch is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638511526" ID="ID_269119378" MODIFIED="1649638512982" TEXT="- Would increase the likelihood that someone contributes a patch, especially a patch written by someone else.  If contributing a patch was just a matter of cherry-picking a tree of commits and submitting it to gerrit, it&apos;s a lot more likely that people would do it.">
<node CREATED="1649722969977" ID="ID_1697361248" MODIFIED="1649722971773" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
<node CREATED="1649724432981" ID="ID_681672181" MODIFIED="1649724435203" TEXT="I strongly disagree about this apportionment of effort. For people like us that are familiar with open source processes and procedures, the logistics of sending patches seems minimal and we focus instead on the challenges of forming consensus. But for people who have never participated in an open source community before, just figuring out where to push code for review, how exactly to use Gerrit, etc. are significant blockers. Anything we can do to reduce this friction would make it more likely that new people will contribute.">
<node CREATED="1649724440221" ID="ID_1967638292" MODIFIED="1649724441292" TEXT="https://lore.kernel.org/openbmc/CADKL2t54-0kUXjDdqajHun4ssQ1WO2gYcH8F9QE8Xnbuoz91kg@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638576464" ID="ID_499927876" MODIFIED="1649639179105" TEXT="Querying properties over the project is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638616094" ID="ID_1728131585" MODIFIED="1649638633750" TEXT="- Greatly increases the ease with which stats are collected.&#xa;Questions like: How many patches were submitted last year?  How many&#xa;lines of code changed between commit A and commit B?  Where was this&#xa;regression injected (ie git bisect)?  How much of our codebase is C++?&#xa;How many users of the dbus Sensor.Value interface are there?  Are all&#xa;easily answered in one liner git commands once this change is done.">
<node CREATED="1649722973289" ID="ID_875590082" MODIFIED="1649722975930" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
<node CREATED="1649724580081" ID="ID_1265065895" MODIFIED="1649724615026" TEXT="GitHub search isn&apos;t the best. I&apos;d much rather be able to easily search through all the code in the project from the command line using something like `git grep`.  This is especially true if you&apos;re looking at historical commits, since you could check out a single interesting SRCREV of openbmc/openbmc and have the corresponding versions of all the userspace daemons available to grep through.">
<node CREATED="1649724588950" ID="ID_827642954" MODIFIED="1649724589962" TEXT="https://lore.kernel.org/openbmc/CADKL2t54-0kUXjDdqajHun4ssQ1WO2gYcH8F9QE8Xnbuoz91kg@mail.gmail.com/"/>
</node>
<node CREATED="1649724083228" ID="ID_416893289" MODIFIED="1649724084177" TEXT="Duplication?  It happens from time to time.  Not being able to search for a bug across the project happens a lot, and in our current model, requires the user to know which component they are filing the bug against.">
<node CREATED="1649724092106" ID="ID_1882093056" MODIFIED="1649724093002" TEXT="https://lore.kernel.org/openbmc/CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com/"/>
</node>
<node CREATED="1649724506418" ID="ID_1580057658" MODIFIED="1649724507425" TEXT="As a maintainer or interested community member, it&apos;s much easier to look through the open issues on a single repo than when distributed across many other less-active repos.  It&apos;s also not always clear exactly which repo is at fault for a bug, and limiting the discussion to people looking at a particular repo may miss out on the relevant knowledge of people looking at other repos instead.">
<node CREATED="1649724511829" ID="ID_1552286544" MODIFIED="1649724512685" TEXT="https://lore.kernel.org/openbmc/CADKL2t54-0kUXjDdqajHun4ssQ1WO2gYcH8F9QE8Xnbuoz91kg@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638711482" ID="ID_1519515584" MODIFIED="1649639179103" TEXT="New repo requests are bottlenecked">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638757526" ID="ID_1100825250" MODIFIED="1649638758467" TEXT="- New features no longer require single-point-of-contact core maintainer processes (ie, creating a repo for changes, setting up maintainer groups, ect) and can just be submitted as a series of patches to openbmc/openbmc.">
<node CREATED="1649722977309" ID="ID_122466730" MODIFIED="1649722978858" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638859183" ID="ID_597978888" MODIFIED="1649639179102" TEXT="Coordinating tree-wide changes is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638872672" ID="ID_1221063525" MODIFIED="1649723421442" TEXT=" - Tree-wide changes (c++ standard, yocto updates, formatting, ect) are much easier to accomplish in a small number of patches, or a series of patches that is easy to pull and test as a unit.">
<node CREATED="1649722979957" ID="ID_534400777" MODIFIED="1649722984942" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649723873840" ID="ID_1212933526" MODIFIED="1649723885950" TEXT="OpenBMC has too much documentation">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649723881184" ID="ID_1551921543" MODIFIED="1649723882221" TEXT="Lots of experienced openbmc developers use devtool every day, I&apos;m not saying it&apos;s not useful, it&apos;s just one more tool.  &quot;more documentation&quot; I don&apos;t think solves this, given that devtool is already well documented in the multi-hundred page mega manual;  Between openbmc docs, yocto docs, and the docs of the projects we pull in, there&apos;s already more documentation than a developer can read when ramping up. The best kind of documentation is that kind that doesn&apos;t need to exist;  The second best kind is where we can point to very well used-in-industry and maintained projects (ie git) and rely on their documentation.">
<node CREATED="1649723896416" ID="ID_1895213649" MODIFIED="1649723897501" TEXT="https://lore.kernel.org/openbmc/CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649723975506" ID="ID_1506132222" MODIFIED="1649724026006" TEXT="Transferring bugs between repos is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649723992132" ID="ID_1255766427" MODIFIED="1649723994078" TEXT="I do not.  I can say that anecdotally the &quot;you filed this bug against the wrong project&quot; happens quite often in the repositories I maintain, and the lack of reasonable cross project &quot;transfer the bug&quot; semantics makes this difficult (yes, admins can transfer bugs cross project, but I&apos;m pretty sure we don&apos;t want to call on core maintainers every time we want to move things around.)  It would be quite helpful to the project to have less than N bug trackers (might not necessarily be one) to increase the odds that someone searches for and finds their bug before filing a duplicate.">
<node CREATED="1649723999706" ID="ID_434821565" MODIFIED="1649724000450" TEXT="https://lore.kernel.org/openbmc/CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649725336470" ID="ID_1476246573" MODIFIED="1649725347348" TEXT="Getting patches reviewed is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649725350070" ID="ID_702523431" MODIFIED="1649725378112" TEXT="We&apos;ve clearly had different experiences (which is fine).  I&apos;ve had multiple developers describe the review process itself as complicated, unstructured, and hard.  This was mentioned explicitly separate from community buy-in, and as someone that goes through the process almost daily, I agree with them that it&apos;s more complex than it should be. For the major initiatives that I&apos;ve had a hand in bringing online in the project, having a clear concise way to talk about the engineering (ie the code) was a much better way at getting consensus than any of our docs processes.  In most cases, it involved pushing to a public, unrelated openbmc fork, waiting for momentum to build, then merging the result when people in the community wanted the capabilities it provided.  Not having a way to do that within the project adds friction.">
<node CREATED="1649725382325" ID="ID_929165500" MODIFIED="1649725383158" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAz1i4tEbs0zTSi2yqth8dtqAVGtcvaYx4bCw+5R3f8VQ@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649725435196" ID="ID_928468509" MODIFIED="1649725458235" TEXT="Identifying the right repo to file a bug against is hard">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649725459951" ID="ID_666559073" MODIFIED="1649725472138" TEXT="That presumes that only a few people have access to resolve bugs. Ideally all maintainers would have access to the bug closure permissions, so they could field bugs by project.  Tagging or assignments could be used to convey where the bug itself lies.  I retract my previous statement, as you&apos;re right, I don&apos;t have numbers, propose the following as a replacement: &quot;A single github bug tracker against the main repo would be a better community driving tool than distributing it across many sub repositories.&quot; I will also admit that there are probably options where we could do that anyway, outside of this proposal.">
<node CREATED="1649725481978" ID="ID_1011150692" MODIFIED="1649725482792" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAz1i4tEbs0zTSi2yqth8dtqAVGtcvaYx4bCw+5R3f8VQ@mail.gmail.com/"/>
</node>
</node>
</node>
<node CREATED="1649638038373" ID="ID_357490952" MODIFIED="1649639179111" POSITION="left" TEXT="Desires">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638048911" ID="ID_1558092718" MODIFIED="1649639155887" TEXT="A set of application and distro changes are easily shareable">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638159209" ID="ID_1965888675" MODIFIED="1649638164902" TEXT="- The tree would be easily shareable amongst the various people working on OpenBMC, without having to rely on a single-source Gerrit instance.  Git is designed to be distributed, but if our recipe files point at other repositories, it largely defeats a lot of this capability.  Today, if you want to share a tree that has a change in it, you have to fork the main tree, then fork every single subproject you&apos;ve made modifications to, then update the main tree to point to your forks.  This gets very onerous over time, especially for simple commits.  Having maintained several different companies forks personally, and spoken to many others having problems with the same, adding major features are difficult to test and rebase because of this.  Moving the code to a single tree makes a lot of the toil of tagging and modifying local trees a lot more manageable, as a series of well-documented git commands (generally git rebase[2]).  It also increases the likelihood that someone pulls down the fork to test it if it&apos;s highly likely that they can apply it to their own tree in a single command.">
<node CREATED="1649723001531" ID="ID_1598178176" MODIFIED="1649723003397" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638107436" ID="ID_1282412748" MODIFIED="1649639159136" TEXT="Minimise reviews">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638224044" ID="ID_1545046942" MODIFIED="1649638227475" TEXT="- There would be a reduction in reviews.  Today, anytime a person wants to make a change that would involve any part of the tree, there&apos;s at least 2 code reviews, one for the commit, and one for the recipe bump.  Compared to a single tree, this at least doubles the number of reviews we need to process.  For changes that want to make any change to a few subsystems, as is the case when developing a feature, they require 2 X &lt;number of project changes&gt; reviews, all of which need to be synchronized.  There is a well documented problem where we have no official way to synchronize merging of changes to userspace applications within a bump without manual human intervention.  This would largely render that problem moot.">
<node CREATED="1649723004655" ID="ID_1978131327" MODIFIED="1649723006303" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638300826" ID="ID_712434388" MODIFIED="1649639166454" TEXT="Make fork maintenance easy">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638320484" ID="ID_319511260" MODIFIED="1649638321571" TEXT="- It would give an opportunity for individuals and companies to &quot;own&quot; well-supported public forks (ie Redhat) of the codebase, which would increase participation in the project overall.  This already happens quite a bit, but in practice, the forks that do it squash history, making it nearly impossible to get their changes upstreamed from an outside entity.">
<node CREATED="1649723007439" ID="ID_1264785232" MODIFIED="1649723009054" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638446175" ID="ID_1065960715" MODIFIED="1649639179113" TEXT="Provide one place to report bugs across the entire project">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638462251" ID="ID_1705498055" MODIFIED="1649638463226" TEXT="- It would centralize the bug databases.  Today, bugs filed against sub projects tend to not get answered.  Having all the bugs in openbmc/openbmc would help in the future to avoid duplicating bugs across projects.">
<node CREATED="1649723010068" ID="ID_797044320" MODIFIED="1649723011531" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638642855" ID="ID_747960128" MODIFIED="1649639179115" TEXT="Minimise effort collecting project statistics">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638665308" ID="ID_1327737686" MODIFIED="1649638666490" TEXT="- Greatly increases the ease with which stats are collected. Questions like: How many patches were submitted last year?  How many lines of code changed between commit A and commit B?  Where was this regression injected (ie git bisect)?  How much of our codebase is C++? How many users of the dbus Sensor.Value interface are there?  Are all easily answered in one liner git commands once this change is done."/>
</node>
<node CREATED="1649638768303" ID="ID_407777683" MODIFIED="1649639179114" TEXT="Make it easy to add new applications">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638796592" ID="ID_920761676" MODIFIED="1649638797614" TEXT="- New features no longer require single-point-of-contact core maintainer processes (ie, creating a repo for changes, setting up maintainer groups, ect) and can just be submitted as a series of patches to openbmc/openbmc.">
<node CREATED="1649723012687" ID="ID_1982732591" MODIFIED="1649723014156" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638831366" ID="ID_1856098282" MODIFIED="1649639179114" TEXT="Make it easy to refactor across the entire project">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638843325" ID="ID_623432561" MODIFIED="1649638844359" TEXT=" - Tree-wide changes (c++ standard, yocto updates, formatting, ect) are much easier to accomplish in a small number of patches, or a series of patches that is easy to pull and test as a unit.">
<node CREATED="1649723015463" ID="ID_1438703059" MODIFIED="1649723016844" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
<node CREATED="1649638967958" ID="ID_622635322" MODIFIED="1649639179113" TEXT="Inclusive naming">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1649638998497" ID="ID_746595646" MODIFIED="1649638999291" TEXT="- Inclusive guidelines: To make progress toward an unrelated but important goal at the same time, I&apos;m recommending that the openbmc/master branch will be left as-is, and the newly-created sha1 will be pushed to the branch openbmc/openbmc:main, to retain peoples links to previous commits on master, and retain the exact project history while at the same time moving the project to having more inclusive naming, as has been documented previously[3].  At some point in the future the master branch could be renamed and deprecated, but this is considered out of scope for this specific change.">
<node CREATED="1649723017815" ID="ID_381268571" MODIFIED="1649723019082" TEXT="https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/"/>
</node>
</node>
</node>
</node>
</map>
