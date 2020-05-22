## colorscheme onedark for vim and virtual terminal

如你们所见，我将我自己的vim配置放在了这样一个仓库下，我配置这个东西配置了一晚上，现在你可以在终端模拟器，或者虚拟终端tty下运行均可

- 其中，vimrc是我在/etc/vim下的vim系统配置文件，由于我是将vim的所有东西放在了/etc/目录下，如果你们要安装插件，并且你们放在你们的用户目录下，需要修改里面出现的所有"/etc/vim/.vim"路径，并且改成"~/.vim"。
- bash.bashrc是使虚拟终端也能显示出onedark配色的关键脚本，我研究了一晚上，终于摸清了xterm下16个颜色通道其中14个通道的的功能, 现在你只需要将里面的第70行以后的代码复制粘贴到你的/etc/bash.bashrc或者～.bashrc中就可以了，然后重新进入虚拟终端就行。 
- 上述的所有功能实现在于你安装好了vim的onedark配色 
- 不过这个onedark主题必须放在用户的.vim目录下，其他目录反而不会生效。

### vim onedark 的安装过程
1.  你需要将colors里的onedark.vim放到你的.vim/colors中，同理，autoload里的onedark.vim也要放大你的autoload文件夹中（没有就建一个,因为这个做个写的脚本里面取的路径就是这个), 这个autoload里的airline和lightline也拷进去。
2. 原版安装可以参考这个[onedark](https://github.com/joshdick/onedark.vim)
> 注意:如果你要下载了原作者的文件，那么autoload里的onedark.vim必须要用我的替换掉（其他的是一样的），因为这个onedark.vim定义了要用到的颜色，如果不修改的话，vim用上VISUAL模式你就什么也看不见, 具体修改了什么请在源代码中查看，有注释。
> 相关的调用在colors/onedark.vim大概130～150行左右，可以去自行研究。

### vimrc的配置，然后你需要在vimrc中添加
```cpp
if &term != "linux"
	set termguicolors
endif

colorscheme onedark

let g:lightline={"colorscheme":"onedark"}
let g:airline="onedark"
```
先要判断出你使用的终端是不是虚拟终端（tty），再开启24-bit颜色(不然你的虚拟终端会显示不出正确的颜色)，不是虚拟终端，开启24位颜色模式，是就不开启。（关于为什么看一下原作者的安装说明）

当你的vim配好onedark配色后，再在你的bash配置文件中添加我的bash配置文件的70行开始的代码，每个通道我都写了解释，可以自己去尝试不同的搭配
