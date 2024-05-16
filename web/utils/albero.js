document.getElementById("albero").addEventListener("click", function () {
    callJSONTree();
});

function callJSONTree() {
    document.getElementById("form").innerHTML = "";
    var latestJSON = document.getElementById("input").value;
    JSONTree(latestJSON);
}


function JSONTree(jsonContent) {
    try {
        jsonContent = JSON.parse(jsonContent);
    } catch (e) {
        return;
    }
    var m = [20, 20, 20, 20], 
        formWidth = document.getElementById("form").clientWidth, 
        formHeight = document.getElementById("form").clientHeight, 
        w = formWidth - m[1] - m[3], 
        h = formHeight - m[0] - m[2]*2, 
        i = 0,
        root;

    var tree = d3.layout.tree()
        .size([h, w]);

    var diagonal = d3.svg.diagonal()
        .projection(function (d) {
            return [d.y, d.x]; 
        });

    var vis = d3.select("#form").append("svg")
        .attr("width", formWidth)
        .attr("height", formHeight-40)
        .append("g")
        .attr("class", 'drawarea')
        .attr("transform", "translate(" + m[3] + "," + m[0] + ")"); 

    var json = prepareFn(jsonContent);
    root = json;
    root.x0 = h / 2;
    root.y0 = 0;

    function toggleAll(d) {
        if (d.children) {
            d.children.forEach(toggleAll);
            toggle(d);
        }
    }

    update(root);

    function update(source) {
        var duration = 500;

        var nodes = tree.nodes(root).reverse();

        nodes.forEach(function (d) {
            d.y = d.depth * 70; 
        });

        var node = vis.selectAll("g.node")
            .data(nodes, function (d) {
                return d.id || (d.id = ++i);
            });

        var nodeEnter = node.enter().append("g")
            .attr("class", "node")
            .attr("transform", function (d) {
                return "translate(" + source.y0 + "," + source.x0 + ")";
            })
            .on("click", function (d) {
                toggle(d);
                update(d);
            });

        nodeEnter.append("circle")
            .attr("r", 1e-6)
            .style("fill", function (d) {
                return d._children ? "lightsteelblue" : "#fff";
            });

        nodeEnter.append("text")
            .attr("x", function (d) {
                return d.children || d._children ? -10 : 10;
            })
            .attr("dy", ".2em") // Modifica il valore per spostare il testo più vicino ai nodi
            .attr("text-anchor", function (d) {
                return d.children || d._children ? "end" : "start";
            })
            .text(function (d) {
                return d.name;
            })
            .style("fill-opacity", 1e-6);

        var nodeUpdate = node.transition()
            .duration(duration)
            .attr("transform", function (d) {
                return "translate(" + d.y + "," + d.x + ")";
            });

        nodeUpdate.select("circle")
            .attr("r", 4.5)
            .style("fill", function (d) {
                return d._children ? "lightsteelblue" : "#fff";
            });

        nodeUpdate.select("text")
            .style("fill-opacity", 1);

        var nodeExit = node.exit().transition()
            .duration(duration)
            .attr("transform", function (d) {
                return "translate(" + source.y + "," + source.x + ")";
            })
            .remove();

        nodeExit.select("circle")
            .attr("r", 1e-6);

        nodeExit.select("text")
            .style("fill-opacity", 1e-6);

        var link = vis.selectAll("path.link")
            .data(tree.links(nodes), function (d) {
                return d.target.id;
            });

        link.enter().insert("path", "g")
            .attr("class", "link")
            .attr("d", function (d) {
                var o = {
                    x: source.x0,
                    y: source.y0
                };
                return diagonal({
                    source: o,
                    target: o
                });
            });

        link.transition()
            .duration(duration)
            .attr("d", diagonal);

        link.exit().transition()
            .duration(duration)
            .attr("d", function (d) {
                var o = {
                    x: source.x,
                    y: source.y
                };
                return diagonal({
                    source: o,
                    target: o
                });
            })
            .remove();

        nodes.forEach(function (d) {
            d.x0 = d.x;
            d.y0 = d.y;
        });
    }
}

function toggle(d) {
    if (d.children) {
        d._children = d.children;
        d.children = null;
    } else {
        d.children = d._children;
        d._children = null;
    }
}

function prepareFn(json) {
    var treeLayout = {
        name: "",
        children: []
    };
    for (var eachItem in json) {
        treeLayout.children.push({
            name: eachItem,
            children: []
        });
    }
    parseInnerValues(treeLayout.children, json);
    return treeLayout;
}

function getSubLayout(sublevel) {
    var layout = [];
    for (var eachItem in sublevel) {
        layout.push({
            name: eachItem,
            children: []
        });
    }
    return layout;
}

function parseInnerValues(treeLayout, json) {
    var returnJSON = {};
    treeLayout.forEach(function (item, idx) {
        if (Object.prototype.toString.call(json[item.name]) === '[object Array]') {
            returnJSON = {};
            returnJSON.name = item.name;
            returnJSON.children = item.children = getSubLayout(json[item.name]);
            parseInnerValues(returnJSON.children, json[item.name]);
        } else if (typeof json[item.name] == "object") {
            returnJSON = {};
            returnJSON.name = item.name;
            returnJSON.children = item.children = getSubLayout(json[item.name]);
            parseInnerValues(returnJSON.children, json[item.name]);
        } else {
            returnJSON = {};
            returnJSON.name = json[item.name];
            returnJSON.children = null;
            if (item.children) {
                item.children[0] = returnJSON;
            } else {
                item.children = [returnJSON];
            }
        }
    });
    return treeLayout;
}
